#!/bin/bash
cd "$(dirname "$0")"
# Libérer le port si déjà occupé
lsof -ti:8765 | xargs kill -9 2>/dev/null
sleep 0.3
python3 serve.py &
sleep 0.8
open http://localhost:8765
echo "Bestiaire Mondial lancé → http://localhost:8765"
echo "Pour arrêter : Ctrl+C dans le terminal, ou fermer l'onglet"
wait
