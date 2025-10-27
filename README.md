# ⚙️ infra-devops-automation

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Vagrant%20%7C%20Ansible%20%7C%20K3s-orange?style=flat-square)
![DevOps Tools](https://img.shields.io/badge/stack-Jenkins%20%7C%20ArgoCD%20%7C%20Grafana%20%7C%20SonarQube%20%7C%20Nexus-green?style=flat-square)

---

## 🧭 Description

**Infra-DevOps-Automation** est une infrastructure **Cloud-Native DevOps** automatisée basée sur **Vagrant**, **Ansible** et **K3s (Kubernetes léger)**.  
Elle déploie un cluster multi-nœuds intégrant une **chaîne CI/CD complète** avec :

🧱 **Jenkins**, 🧩 **Nexus**, 🔍 **SonarQube**, 🚀 **ArgoCD**, 📈 **Prometheus**, et 📊 **Grafana**,  
ainsi qu’un **serveur NFS** pour le stockage persistant.  

Le but est de fournir un **laboratoire complet** pour l’apprentissage, la formation ou le test de pipelines CI/CD et GitOps dans un environnement Kubernetes local.

---

## 🧩 Architecture globale

![Architecture - Infra DevOps Automation](A_2D_digital_diagram_depicts_an_infrastructure_for.png)

### 🗺️ Détails du schéma :
- **Control Plane (K3s Master)** : ArgoCD, Dashboard, Kubernetes API.  
- **Workers** : Jenkins (CI), Nexus (repo), SonarQube (qualité du code).  
- **Monitoring Node** : Prometheus + Grafana pour la supervision.  
- **NFS Server** : stockage persistant pour les pods et données CI/CD.  

---

## 🖥️ Configuration des machines virtuelles

| Nom | IP | Rôle | Ressources | Description |
|------|----|------|-------------|--------------|
| **control** | `192.168.56.1` | K3s Master / ArgoCD / Dashboard | 4 Go / 2 CPU | Serveur principal du cluster |
| **server-1** | `192.168.56.2` | Worker Node | 2 Go / 2 CPU | Nœud de calcul |
| **server-2** | `192.168.56.3` | Worker Node | 2 Go / 2 CPU | Nœud de calcul |
| **worker-1** | `192.168.56.4` | Jenkins CI | 4 Go / 2 CPU | Intégration continue |
| **worker-2** | `192.168.56.5` | Nexus Repo | 4 Go / 2 CPU | Stockage des artifacts |
| **cicd** | `192.168.56.6` | Plateforme CI/CD | 4 Go / 2 CPU | Environnement pipeline complet |
| **monitoring** | `192.168.56.7` | Prometheus + Grafana | 4 Go / 2 CPU | Supervision et métriques |
| **nfs** | `192.168.56.8` | NFS Server | 1 Go / 1 CPU | Stockage persistant partagé |
| **argocd** | `192.168.56.9` | ArgoCD | 4 Go / 2 CPU | Gestion GitOps |

---

## ⚙️ Objectifs du projet

- Déployer une **infrastructure DevOps complète et modulaire**.  
- Automatiser le provisionnement avec **Ansible**.  
- Orchestrer des conteneurs via **K3s** (Kubernetes lightweight).  
- Intégrer une **chaîne CI/CD** complète.  
- Fournir un **laboratoire reproductible** pour la formation DevOps.

---

## 🧰 Stack technique

| Outil | Fonction |
|-------|-----------|
| [**K3s**](https://k3s.io) | Cluster Kubernetes léger |
| [**Vagrant**](https://www.vagrantup.com) + [**VirtualBox**](https://www.virtualbox.org) | Provisionnement des VMs |
| [**Ansible**](https://www.ansible.com) | Automatisation du déploiement |
| [**Jenkins**](https://www.jenkins.io) | Intégration continue |
| [**Nexus**](https://www.sonatype.com/products/repository-oss) | Gestion des artifacts |
| [**SonarQube**](https://www.sonarqube.org) | Qualité du code |
| [**ArgoCD**](https://argo-cd.readthedocs.io) | Déploiement GitOps |
| [**Prometheus**](https://prometheus.io) | Monitoring |
| [**Grafana**](https://grafana.com) | Visualisation et alerting |
| [**NFS**](https://wiki.debian.org/NFS) | Stockage persistant |

---

## 🚀 Déploiement rapide

### 1️⃣ Cloner le dépôt
```bash
git clone https://github.com/yassinenakkabi/infra-devops-automation.git
cd infra-devops-automation
