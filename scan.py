import subprocess
import sys

scope= input('Enter scope file')

def run_nmap():
    try:
        command = [
            "nmap", "-sC", "-sV", "-Pn", "-p-", "-vvv",
            "-oN", "nmapscan.txt", "-iL", scope
        ]

        print("Lancement du scan Nmap...")
        subprocess.run(command, check=True)
        print("Scan Nmap terminé. Lancement de scrapnmap...")
        subprocess.run(["scrapnmap", "-f", "nmapscan.txt"], check=True)

        print("Traitement terminé avec succès.")
    except subprocess.CalledProcessError as e:
        print(f"Une erreur s'est produite lors de l'exécution de la commande : {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_nmap()
