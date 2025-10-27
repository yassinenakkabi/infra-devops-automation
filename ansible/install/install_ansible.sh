#!/bin/bash
# =====================================================
# 🚀 Installation d'Ansible sur Ubuntu (VM control)
# =====================================================

echo "[INFO] Mise à jour du système..."
sudo apt update -y && sudo apt upgrade -y

echo "[INFO] Installation de Python3 et Ansible..."
sudo apt install -y ansible python3-pip

echo "[INFO] Vérification de la version d'Ansible..."
ansible --version

echo "[SUCCESS] ✅ Ansible est installé avec succès sur cette machine."

