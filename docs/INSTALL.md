# 🧰 Guide d’installation – infra-devops-automation

Ce document décrit **toutes les étapes détaillées** pour déployer et configurer le projet **Infra DevOps Automation** :  
un environnement **Cloud-Native CI/CD** complet basé sur **Vagrant**, **Ansible** et **K3s** (Kubernetes léger).

---

## 🧭 Prérequis

Avant de commencer, assure-toi d’avoir installé sur ta machine hôte :

| Logiciel | Version minimale | Lien |
|-----------|------------------|------|
| **VirtualBox** | 6.1+ | [https://www.virtualbox.org](https://www.virtualbox.org) |
| **Vagrant** | 2.3+ | [https://www.vagrantup.com](https://www.vagrantup.com) |
| **Ansible** | 2.14+ | [https://docs.ansible.com](https://docs.ansible.com) |
| **Git** | 2.30+ | [https://git-scm.com](https://git-scm.com) |

---

## 📦 Cloner le projet

```bash
git clone https://github.com/yassinenakkabi/infra-devops-automation.git
cd infra-devops-automation

🖥️ Démarrer les machines virtuelles

Ce projet utilise Vagrant + VirtualBox pour créer automatiquement toutes les VMs nécessaires.

🔹 Lancer toutes les machines :
vagrant up


🧠 Cette commande peut prendre plusieurs minutes lors du premier lancement (téléchargement de l’image Ubuntu 22.04).

🔹 Vérifier les machines :
vagrant status


Tu devrais voir toutes les VMs en statut running :

control           running (virtualbox)
server-1          running (virtualbox)
server-2          running (virtualbox)
worker-1          running (virtualbox)
worker-2          running (virtualbox)
cicd              running (virtualbox)
monitoring        running (virtualbox)
nfs               running (virtualbox)
argocd            running (virtualbox)

🔐 Connexion à la VM principale (control)
vagrant ssh control


Depuis cette VM, tu vas exécuter Ansible pour configurer tout le cluster.

⚙️ Installation automatique via Ansible

Depuis la VM control :

cd ~/infra-devops-automation/ansible

1️⃣ Installer K3s (Kubernetes lightweight)
ansible-playbook playbooks/install_k3s.yml

2️⃣ Joindre les workers au cluster
ansible-playbook playbooks/join_k3s.yml

3️⃣ Installer le serveur NFS (stockage persistant)
ansible-playbook playbooks/install_nfs.yml

4️⃣ Installer Jenkins (CI)
ansible-playbook playbooks/install_jenkins.yml

🚀 Déployer les outils sur Kubernetes

Une fois K3s installé et opérationnel :

cd ~/infra-devops-automation/k8s

Déployer les différents composants :
kubectl apply -f argocd/
kubectl apply -f jenkins/
kubectl apply -f nexus/
kubectl apply -f sonarqube/
kubectl apply -f monitoring/

🔍 Vérifications
Vérifier les nœuds :
kubectl get nodes -o wide

Vérifier les pods :
kubectl get pods -A


Tous les pods doivent être en statut Running ✅

🧩 Accès aux outils
Outil	Port	Accès
Jenkins	8080	http://192.168.56.4:8080
Nexus	8081	http://192.168.56.5:8081
SonarQube	9000	http://192.168.56.3:9000
ArgoCD	8082 ou 30080	http://192.168.56.9:8082
Grafana	3000	http://192.168.56.7:3000
Prometheus	9090	http://192.168.56.7:9090

💡 Les ports peuvent varier selon ta configuration YAML. Vérifie avec kubectl get svc -A.

📊 Sauvegarde et restauration du cluster
Sauvegarde :
sudo k3s kubectl get all -A -o yaml > ~/infra-devops-automation/k3s_backup.yaml

Restauration :
sudo k3s kubectl apply -f ~/infra-devops-automation/k3s_backup.yaml

⚠️ Dépannage rapide
Problème	Cause possible	Solution
InvalidDiskCapacity 0	Partition pleine ou non montée	Vérifie df -h et redimensionne avec growpart / resize2fs
Pods bloqués en ImagePullBackOff	Problème réseau ou image inexistante	Vérifie le nom d’image et la connectivité Docker Hub
Erreur permission denied /var/run/docker.sock	Droits utilisateur	sudo usermod -aG docker $USER && newgrp docker
VM ne démarre pas	Manque de RAM	Augmente la mémoire dans Vagrantfile (4 Go minimum pour control)
🧠 Astuce DevOps

Pour éteindre toutes les VMs :

vagrant halt


Pour les supprimer complètement :

vagrant destroy -f

👨‍💻 Auteur

Yassine Nakkabi
🧑‍💻 DevOps Engineer — Cloud & Automation Enthusiast
📧 yassinenakkabi.dev@gmail.com

🌐 github.com/yassinenakkabi

🧾 Licence

Ce projet est distribué sous la licence MIT.
Libre à toi de le réutiliser, le modifier ou l’adapter à tes besoins professionnels ou pédagogiques.


