#!/usr/bin/env python3
"""
Génère automatiquement les 407 doubles-pages du Bestiaire Mondial via l'API OpenAI.

Setup :
    pip install openai pillow
    export OPENAI_API_KEY="sk-..."  # ton clé API
    python3 _BookA/auto_generate.py

Le script :
- Lit les prompts de _BookA/FULL_PROMPTS/
- Appelle l'API gpt-image-1 (même moteur que ChatGPT)
- Sauvegarde les images dans _BookA/images/<XX_Tradition>/
- Skippe les images déjà générées (resume si interrompu)
- Coût estimé : ~$25-35 pour les 407 images en haute qualité

Options :
    --start 1       commencer à la créature N
    --end 407       arrêter à la créature N
    --tradition 01_Nordique   ne traiter qu'une seule tradition
    --dry-run       afficher ce qui serait fait sans appeler l'API
    --quality high  qualité haute (par défaut), ou "medium" pour économiser
"""

import os
import sys
import re
import argparse
from pathlib import Path
from openai import OpenAI
import base64
import time

REPO_ROOT = Path(__file__).resolve().parent.parent
PROMPTS_DIR = REPO_ROOT / "_BookA" / "FULL_PROMPTS"
IMAGES_DIR = REPO_ROOT / "_BookA" / "images"


def parse_prompt_file(filepath: Path):
    """Extrait nom + tradition + prompt complet."""
    name = filepath.stem  # ex: 001_Fenrir
    match = re.match(r"(\d{3})_(.+)", name)
    if not match:
        return None
    num, creature = match.groups()

    text = filepath.read_text(encoding="utf-8")

    # Trouver la tradition
    trad_match = re.search(r"Tradition\s*:\s*(.+)", text)
    if trad_match:
        trad_label = trad_match.group(1).strip()
    else:
        trad_label = "?"

    # Trouver le numéro de tradition (depuis le path attendu de l'image)
    # On cherche dans SELECTION.md la tradition complète
    trad_dir = find_tradition_dir(creature)

    return {
        "num": num,
        "creature": creature,
        "trad_dir": trad_dir,
        "prompt": text,
    }


def find_tradition_dir(creature_name: str) -> str:
    """Cherche dans quel dossier XX_Tradition la créature se trouve."""
    for d in REPO_ROOT.iterdir():
        if d.is_dir() and re.match(r"^\d{2}_", d.name):
            if (d / "creatures" / f"{creature_name}.md").exists():
                return d.name
    return "_unknown"


def already_generated(num: str, creature: str, trad_dir: str) -> bool:
    """Vérifie si l'image existe déjà."""
    target = IMAGES_DIR / trad_dir / f"{num}_{creature}.png"
    return target.exists() and target.stat().st_size > 1000


def generate_image(client: OpenAI, prompt: str, quality: str = "high") -> bytes:
    """Appelle l'API OpenAI pour générer l'image. Retourne les bytes PNG."""
    response = client.images.generate(
        model="gpt-image-1",
        prompt=prompt,
        size="1536x1024",  # paysage = adapté au double-page
        quality=quality,
        n=1,
    )
    image_b64 = response.data[0].b64_json
    return base64.b64decode(image_b64)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--start", type=int, default=1)
    parser.add_argument("--end", type=int, default=407)
    parser.add_argument("--tradition", type=str, default=None,
                        help="ex: 01_Nordique pour limiter à une tradition")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--quality", choices=["medium", "high"], default="high")
    parser.add_argument("--delay", type=float, default=2.0,
                        help="secondes entre 2 appels API (anti rate-limit)")
    args = parser.parse_args()

    if not args.dry_run:
        api_key = os.environ.get("OPENAI_API_KEY")
        if not api_key:
            print("❌ OPENAI_API_KEY n'est pas dans l'environnement.")
            print("   export OPENAI_API_KEY='sk-...'  puis relance.")
            sys.exit(1)
        client = OpenAI(api_key=api_key)
    else:
        client = None

    files = sorted(PROMPTS_DIR.glob("*.txt"))
    todo = []
    for f in files:
        info = parse_prompt_file(f)
        if not info:
            continue
        n = int(info["num"])
        if n < args.start or n > args.end:
            continue
        if args.tradition and info["trad_dir"] != args.tradition:
            continue
        todo.append(info)

    print(f"→ {len(todo)} créatures à traiter")
    if args.dry_run:
        for info in todo:
            status = "✓" if already_generated(info["num"], info["creature"], info["trad_dir"]) else "○"
            print(f"  {status} {info['num']} {info['creature']:<30} → {info['trad_dir']}/")
        return

    skipped = 0
    generated = 0
    failed = 0
    start_time = time.time()

    for info in todo:
        if already_generated(info["num"], info["creature"], info["trad_dir"]):
            print(f"  ✓ {info['num']} {info['creature']} (déjà fait)")
            skipped += 1
            continue

        target_dir = IMAGES_DIR / info["trad_dir"]
        target_dir.mkdir(parents=True, exist_ok=True)
        target_path = target_dir / f"{info['num']}_{info['creature']}.png"

        print(f"  ⏳ {info['num']} {info['creature']:<30} ...", end="", flush=True)
        try:
            image_bytes = generate_image(client, info["prompt"], quality=args.quality)
            target_path.write_bytes(image_bytes)
            print(f" ✓ {len(image_bytes)//1024} ko")
            generated += 1
        except Exception as e:
            print(f" ✗ ERREUR : {e}")
            failed += 1

        time.sleep(args.delay)

    elapsed = time.time() - start_time
    print()
    print(f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print(f"  Générées        : {generated}")
    print(f"  Déjà existantes : {skipped}")
    print(f"  Échecs          : {failed}")
    print(f"  Durée totale    : {elapsed/60:.1f} min")
    if generated > 0:
        cost_estimate = generated * 0.08  # estimation HD gpt-image-1
        print(f"  Coût API estimé : ~${cost_estimate:.2f}")
    print(f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")


if __name__ == "__main__":
    main()
