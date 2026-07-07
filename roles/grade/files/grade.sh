#!/usr/bin/env bash
set -e

if ! command -v ansible-playbook &>/dev/null; then
    echo "Error: ansible-playbook not found." >&2
    exit 1
fi

if ! ansible-galaxy collection list 2>/dev/null | grep -q "zenika\.training"; then
    echo "Error: collection zenika.training not found." >&2
    echo "Install with: ansible-galaxy collection install git+https://github.com/Zenika-Training/ansible_collection.git" >&2
    exit 1
fi

ANSIBLE_CFG="/usr/local/share/zenika/grade/ansible.cfg"
VARS_DIR="$HOME/.hidden/grades/vars"

_ok()  { echo "[OK]  $1"; }
_ko()  { echo "[KO]  $1"; GRADE_CHECK_FAILED=1; }

if [ -z "$1" ]; then
    echo "Usage: grade <lab>   (ex: grade lab02)" >&2
    echo "       grade check   (vérifie l'environnement)" >&2
    exit 1
fi

if [ "$1" = "check" ]; then
    echo "=== Vérification de l'environnement grade ==="
    GRADE_CHECK_FAILED=0

    if command -v ansible-playbook &>/dev/null; then
        _ok "ansible-playbook $(ansible-playbook --version 2>/dev/null | head -1)"
    else
        _ko "ansible-playbook non trouvé"
    fi

    if ansible-galaxy collection list 2>/dev/null | grep -q "zenika\.training"; then
        _ok "collection zenika.training installée"
    else
        _ko "collection zenika.training non trouvée"
    fi

    if [ -d "$VARS_DIR" ]; then
        LABS=$(ls "$VARS_DIR"/*.yml 2>/dev/null | xargs -r -I{} basename {} .yml | sort | tr '\n' ' ')
        _ok "Solutions déployées — labs disponibles : ${LABS:-aucun}"
    else
        _ko "Solutions non déployées"
    fi

    exit "$GRADE_CHECK_FAILED"
fi

LAB="$1"
[[ "$LAB" != lab* ]] && LAB="lab$LAB"

ANSIBLE_CONFIG="$ANSIBLE_CFG" \
    ansible-playbook zenika.training.grade -e "grade_lab=$LAB"
