#!/usr/bin/env python3
"""Bestiaire Mondial — serveur local (Python stdlib, aucune dépendance)"""
import json, mimetypes, re, sys
from http.server import HTTPServer, BaseHTTPRequestHandler
from pathlib import Path
from urllib.parse import urlparse, unquote

PORT = 8765
BASE = Path(__file__).parent

TRADITIONS = [
    ("01_Nordique","Nordique","Europe"), ("02_Celtique","Celtique","Europe"),
    ("03_Germanique","Germanique","Europe"), ("04_Greco_Romain","Gréco-Romain","Europe"),
    ("05_Slave","Slave","Europe"), ("06_Mesopotamien","Mésopotamien","Moyen-Orient"),
    ("07_Egyptien","Égyptien","Afrique"), ("08_Cananeen_Semitique","Cananéen","Moyen-Orient"),
    ("09_Indien","Indien","Asie"), ("10_Tibetain_Himalayen","Tibétain","Asie"),
    ("11_Chinois","Chinois","Asie"), ("12_Japonais","Japonais","Asie"),
    ("13_Coreen","Coréen","Asie"), ("14_Sud_Est_Asiatique","Sud-Est Asiatique","Asie"),
    ("15_Polynesien","Polynésien","Océanie"), ("16_Amerindien_Nord","Amérindien Nord","Amériques"),
    ("17_Amerindien_Centre_Sud","Amérindien Centre-Sud","Amériques"),
    ("18_Africain","Africain","Afrique"), ("19_Siberien_Arctique","Sibérien","Asie"),
    ("20_Cryptides_Contemporains","Cryptides","Monde"), ("21_Iranien_Perse","Iranien","Moyen-Orient"),
    ("22_Turcique_Altaique","Turcique","Asie"), ("23_Inuit_Arctique_Americain","Inuit","Amériques"),
    ("24_Amazonien","Amazonien","Amériques"), ("25_Azteque","Aztèque","Amériques"),
    ("26_Maya","Maya","Amériques"), ("27_Inca","Inca","Amériques"),
    ("28_Afro_Americain_Syncretique","Afro-Américain","Amériques"),
    ("29_Corne_Afrique","Corne d'Afrique","Afrique"), ("30_Madagascar","Madagascar","Afrique"),
    ("31_Philippines","Philippines","Asie"), ("32_Indonesie","Indonésie","Asie"),
    ("33_Papouasie_Melanesie","Papouasie","Océanie"), ("34_Aborigene_Australien","Aborigène","Océanie"),
    ("35_Caucase","Caucase","Europe"), ("36_Balkans","Balkans","Europe"),
    ("37_Iberique","Ibérique","Europe"), ("38_Caraibes","Caraïbes","Amériques"),
    ("39_Andes","Andes","Amériques"), ("40_Maghreb","Maghreb","Afrique"),
]

IMG_EXTS = ('.jpg', '.jpeg', '.png', '.webp')

def find_image(trad_dir, slug, page):
    img_dir = BASE / trad_dir / "creatures" / "images"
    for ext in IMG_EXTS:
        p = img_dir / f"{slug}_{page}{ext}"
        if p.exists():
            return "/" + str(p.relative_to(BASE)).replace("\\", "/")
    return None

def parse_meta(text):
    meta = {}
    m = re.match(r'^---\n(.*?)\n---', text, re.DOTALL)
    if not m:
        return meta
    for line in m.group(1).splitlines():
        if ':' in line and not line.startswith(' ') and not line.startswith('-'):
            k, _, v = line.partition(':')
            meta[k.strip()] = v.strip()
    return meta

def build_data():
    data = []
    for dir_name, label, zone in TRADITIONS:
        cr_path = BASE / dir_name / "creatures"
        creatures = []
        if cr_path.exists():
            for md in sorted(cr_path.glob("*.md")):
                try:
                    text = md.read_text(encoding='utf-8')
                    meta = parse_meta(text)
                    slug = md.stem
                    creatures.append({
                        "slug": slug,
                        "nom": meta.get("nom_principal", slug),
                        "categorie": meta.get("categorie", ""),
                        "statut": meta.get("statut", ""),
                        "date": meta.get("date_rédaction", meta.get("date_redaction", "")),
                        "img1": find_image(dir_name, slug, 1),
                        "img2": find_image(dir_name, slug, 2),
                    })
                except Exception:
                    pass
        data.append({"dir": dir_name, "label": label, "zone": zone, "creatures": creatures})
    return data

class Handler(BaseHTTPRequestHandler):
    def log_message(self, *a): pass  # silence

    def send_json(self, obj, code=200):
        body = json.dumps(obj, ensure_ascii=False).encode('utf-8')
        self.send_response(code)
        self.send_header('Content-Type', 'application/json; charset=utf-8')
        self.send_header('Content-Length', str(len(body)))
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        self.wfile.write(body)

    def send_bytes(self, body, mime, code=200):
        self.send_response(code)
        self.send_header('Content-Type', mime)
        self.send_header('Content-Length', str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        self.end_headers()

    def do_GET(self):
        path = unquote(urlparse(self.path).path)

        if path == '/api/data':
            self.send_json(build_data())
            return

        if path.startswith('/api/md/'):
            # /api/md/01_Nordique/Fenrir
            rest = path[8:]
            idx = rest.find('/')
            if idx != -1:
                trad, slug = rest[:idx], rest[idx+1:]
                md_path = BASE / trad / 'creatures' / (slug + '.md')
                if md_path.exists():
                    self.send_bytes(md_path.read_bytes(), 'text/plain; charset=utf-8')
                    return
            self.send_response(404); self.end_headers()
            return

        # Static files (images, etc.)
        file_path = BASE / path.lstrip('/')
        if file_path.is_file():
            mime = mimetypes.guess_type(str(file_path))[0] or 'application/octet-stream'
            self.send_bytes(file_path.read_bytes(), mime)
        elif path in ('/', '/dashboard', '/dashboard.html'):
            dash = BASE / 'dashboard.html'
            self.send_bytes(dash.read_bytes(), 'text/html; charset=utf-8')
        else:
            self.send_response(404); self.end_headers()

    def do_POST(self):
        path = unquote(urlparse(self.path).path)
        if path.startswith('/api/upload/'):
            # /api/upload/01_Nordique/Fenrir/1
            parts = path[12:].split('/')
            if len(parts) == 3:
                trad, slug, page = parts
                self.handle_upload(trad, slug, page)
                return
        self.send_response(400); self.end_headers()

    def handle_upload(self, trad, slug, page):
        ct = self.headers.get('Content-Type', 'image/jpeg')
        length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(length)
        ext = '.png' if 'png' in ct else '.webp' if 'webp' in ct else '.jpg'
        img_dir = BASE / trad / 'creatures' / 'images'
        img_dir.mkdir(parents=True, exist_ok=True)
        # Remove any existing image for this slot
        for old_ext in IMG_EXTS:
            old = img_dir / f"{slug}_{page}{old_ext}"
            if old.exists():
                old.unlink()
        out = img_dir / f"{slug}_{page}{ext}"
        out.write_bytes(body)
        rel = "/" + str(out.relative_to(BASE)).replace("\\", "/")
        self.send_json({"ok": True, "path": rel})

if __name__ == '__main__':
    print(f"\n  Bestiaire Mondial  →  http://localhost:{PORT}\n  Ctrl+C pour arrêter\n")
    try:
        HTTPServer(('', PORT), Handler).serve_forever()
    except KeyboardInterrupt:
        print("\nServeur arrêté.")
        sys.exit(0)
