#!/usr/bin/env bash
set -e

if ! command -v ansible-playbook &>/dev/null; then
    echo "Erreur : ansible-playbook introuvable." >&2
    exit 1
fi

if ! ansible-galaxy collection list 2>/dev/null | grep -q "zenika\.training"; then
    echo "Erreur : collection zenika.training introuvable." >&2
    echo "Installer avec : ansible-galaxy collection install git+https://github.com/Zenika-Training/ansible_collection.git" >&2
    exit 1
fi

GRADES_DIR="$HOME/workspaces/grades"
ANSIBLE_CFG="/usr/local/share/zenika/grade/ansible.cfg"

if [ -z "$1" ]; then
    echo "Usage: grade <lab>  (ex: grade lab01)" >&2
    exit 1
fi

LAB="$1"
[[ "$LAB" != lab* ]] && LAB="lab$LAB"

ANSIBLE_CONFIG="$ANSIBLE_CFG" \
    ansible-playbook "$GRADES_DIR/grade.yml" --tags "$LAB"
