# Exegol Resources

Ce dépôt est un simple regroupement de mes ressources pour Exegol, me permettant de lancer des conteneurs personnalisés selon mon flux de travail.

## Introduction
Exegol est un outil puissant qui facilite le déploiement et la gestion de conteneurs. Ce référentiel contient des scripts, des configurations, et d'autres ressources spécifiques à mon utilisation d'Exegol.
[Exegol GitHub Repository](https://github.com/ThePorgs/Exegol)

## Fonctionnalités

- **Utilisation de tmux avec la souris :** Plus besoin de connaître une multitude de raccourcis clavier.
- **Division du terminal tmux :** Divisez le terminal tmux en quatre en utilisant simplement `Ctrl+b+'`.
- **Lancement d'un serveur web Python en upload :** Utilisez la commande `runwww 80`.
- **Activation directe du SSH sur votre machine :** Utilisez la commande `sshon`.
- **Réinitialisation de l'interface réseau :** Utilisez la commande `runeth`.
- **Affichage et copie de l'adresse IP TUN0 :** Utilisez la commande `tun0`.
- **Copie de la commande pour obtenir un shell dynamique sous Linux :** Utilisez la commande `pty`.
- **Copie de la commande pour passer en AZERTY (PowerShell) :** Utilisez la commande `getfr`.
- **Lancement d'un serveur FTP accessible en mode anonyme :** Utilisez la commande `runftp`.
- **Lancement d'un serveur WebDAV sur le port 80 :** Partage du dossier "runwebdav".

 Astuce :
 `tun0 && runwww 80` Permet de lancer un serveur web et d'avoir l'ip tun0 directement dans le pressepapier 
  

## Installation
   ```bash
   git clone https://github.com/Frozenka/Exegol-Ressources.git
   cd Exegol-Ressources
   bash install.sh
   ```

## Contribuer
N'hésitez pas à contribuer en ouvrant des problèmes, en proposant des améliorations, ou en soumettant des demandes de fusion. Votre contribution est appréciée !
