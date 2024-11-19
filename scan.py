import subprocess
import sys

scope = input("Entrez le fichier contenant la liste des cibles (scope) :\n")

def run_nmap():
    try:
        # Commande Nmap avec export en XML et sortie vers fichier texte
        nmap_command = [
            "nmap", "-sC", "-sV", "-Pn", "-p-", "-vvv",
            "-T3", "-iL", scope, "-oX", "./nmap.xml"
        ]

        print("Lancement du scan Nmap...")
        # Redirection de la sortie vers resultatnmap.txt
        with open("resultatnmap.txt", "a") as output_file:
            subprocess.run(nmap_command, stdout=output_file, stderr=subprocess.STDOUT, check=True)

        print("Scan Nmap terminé. Lancement de scrapnmap...")
        # Commande Scrapmap avec le fichier XML généré
        scrapmap_command = ["python3", "/opt/resources/scrapmap.py", "-f", "./nmap.xml"]
        subprocess.run(scrapmap_command, check=True)

        print("Traitement terminé avec succès.")
    except subprocess.CalledProcessError as e:
        print(f"Une erreur s'est produite lors de l'exécution de la commande : {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_nmap()
