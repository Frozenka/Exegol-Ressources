import argparse
import xmltodict

def nmap_xml_to_markdown(xml_file, output_file):
    # Charger le fichier XML
    try:
        with open(xml_file, 'r') as file:
            data = xmltodict.parse(file.read())
    except FileNotFoundError:
        print(f"Erreur : Le fichier '{xml_file}' n'existe pas.")
        return
    except Exception as e:
        print(f"Erreur lors de la lecture du fichier XML : {e}")
        return

    # Extraire les données principales
    hosts = data.get("nmaprun", {}).get("host", [])

    if not isinstance(hosts, list):
        hosts = [hosts]  # Gérer le cas où un seul hôte est présent

    md_lines = ["# Rapport Nmap", ""]

    for idx, host in enumerate(hosts, start=1):
        # Adresses IP
        addresses = host.get("address", [])
        if not isinstance(addresses, list):
            addresses = [addresses]

        ip_address = next((addr["@addr"] for addr in addresses if addr["@addrtype"] == "ipv4"), "Inconnu")
        md_lines.append(f"##### Résultats pour l'adresse IP: {ip_address}")
        md_lines.append("")  # Ligne vide pour la lisibilité

        # Ports ouverts
        ports = host.get("ports", {}).get("port", [])
        if not isinstance(ports, list):
            ports = [ports]

        if ports:
            # Construire un tableau Markdown pour les ports
            md_lines.append("| PORT       | STATE | SERVICE | REASON        | VERSION         |")
            md_lines.append("|------------|-------|---------|---------------|-----------------|")
            for port in ports:
                proto = port["@protocol"]
                port_id = port["@portid"]
                state = port["state"]["@state"]
                reason = port["state"].get("@reason", "inconnu")
                service = port.get("service", {}).get("@name", "inconnu")

                # Récupérer la version si disponible
                service_data = port.get("service", {})
                product = service_data.get("@product", "")
                version = service_data.get("@version", "")
                extrainfo = service_data.get("@extrainfo", "")
                full_version = " ".join(filter(None, [product, version, extrainfo]))

                if not full_version:
                    full_version = "inconnu"

                md_lines.append(f"| {port_id}/{proto} | {state} | {service} | {reason} | {full_version} |")
        else:
            md_lines.append("Aucun port ouvert détecté.")

        md_lines.append("")  # Ligne vide pour séparer les hôtes

    # Sauvegarder en Markdown
    with open(output_file, "w") as file:
        file.write("\n".join(md_lines))

    print(f"Rapport Markdown généré : {output_file}")

# Gestion des arguments de ligne de commande
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Transforme un export Nmap XML en fichier Markdown avec des tableaux.")
    parser.add_argument("-f", "--file", required=True, help="Chemin vers le fichier Nmap XML.")
    parser.add_argument("-o", "--output", default="nmap_report.md", help="Nom du fichier de sortie Markdown (par défaut : nmap_report.md).")
    args = parser.parse_args()

    nmap_xml_to_markdown(args.file, args.output)
