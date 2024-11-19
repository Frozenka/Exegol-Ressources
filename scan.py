import subprocess
import sys

scope = input("Entrez le fichier contenant la liste des cibles (scope) :\n")

def run_nmap():
    try:
        # Commande Nmap
        command = [
            "nmap", "-sC", "-sV", "-Pn", "-p-", "-vvv",
            "-T3", "-iL", scope, "-oX", "nmap.xml"
        ]

        print("Lancement du scan Nmap...")
        # Exécuter la commande Nmap
        with open("resultatnmap.txt", "a") as output_file:
            subprocess.run(command, stdout=output_file, stderr=subprocess.STDOUT, check=True)

        print("Scan Nmap terminé. Lancement de scrapnmap...")
        # Lancer le script `scrapmap.py` avec l'export XML
        subprocess.run(["python3", "/opt/resources/scrapmap.py", "-f", "nmap.xml"], check=True)

        print("Traitement terminé avec succès.")
    except subprocess.CalledProcessError as e:
        print(f"Une erreur s'est produite lors de l'exécution de la commande : {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_nmap()
