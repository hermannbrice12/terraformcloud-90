# terraformcloud-90
Projet : Déploiement d’une instance AWS EC2 avec Terraform Cloud & GitHub Actions
Description

Ce projet met en place une infrastructure AWS (EC2) en utilisant la méthodologie Infrastructure as Code (IaC) avec Terraform.

L’automatisation est assurée par :
- GitHub Actions : pipeline CI/CD qui déclenche les runs.

-Terraform Cloud : exécute le plan et l’apply de Terraform.

- AWS : fournit les ressources cloud (EC2).



# Architecture & Liaison des outils

GitHub Actions : pipeline configuré dans .github/workflows/deploy.yml.

Lors d’un git push, le workflow s’exécute.

Il utilise un Terraform Cloud Token (stocké dans GitHub Secrets) pour communiquer avec Terraform Cloud.

Terraform Cloud :

Workspace configuré pour exécuter les plans et apply.

Récupère les variables d’environnement AWS pour se connecter à AWS.

AWS :

Provisionnement de l’instance EC2.

Authentification grâce aux AWS Access Keys (définies dans Terraform Cloud en variables sensibles).



# Configuration des secrets

- Dans GitHub → Settings → Secrets and variables → Actions

Définir les secrets suivants :

TFC_TOKEN → le Terraform Cloud User Token (permet à GitHub Actions d’appeler Terraform Cloud).

- Dans Terraform Cloud → Workspace → Variables

# Environment variables :
  
  AWS_ACCESS_KEY_ID     = <votre_access_key>
AWS_SECRET_ACCESS_KEY = <votre_secret_key>
AWS_DEFAULT_REGION    = eu-west-

# structure du projet

.
├── .github/
│   └── workflows/
│       └── deploy.yml    # Pipeline GitHub Actions
├── provider.tf           # Configuration du provider AWS
├── variables.tf          # Variables (ex: région)
├── ec2.tf                # Ressource EC2
└── README.md             # Documentation


# Déploiement

Faire un git push sur la branche main.

GitHub Actions déclenche automatiquement le workflow.

Le workflow contacte Terraform Cloud via TFC_TOKEN.

Terraform Cloud exécute plan et apply.

Une instance EC2 est déployée sur AWS.

# vérification
Vérifier dans la console Terraform Cloud → Runs (plan & apply).

Vérifier dans la console AWS → EC2 → Instances.