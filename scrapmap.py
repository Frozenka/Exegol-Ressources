import argparse
import re

def extract_nmap_data(file_path):

    results = {}
    current_ip = None

    with open(file_path, 'r') as file:

        for line in file:

            ip_match = re.match(r'Nmap scan report for (\S+)', line)

            if ip_match:

                current_ip = ip_match.group(1)

                results[current_ip] = []

                continue

            port_match = re.match(r'(\d+/tcp)\s+(\S+)\s+(\S+)\s+(\S+)\s+(.+)', line)

            if port_match and current_ip:

                port, state, service, reason, version = port_match.groups()

                results[current_ip].append((port, state, service, reason, version))

    return results


def generate_markdown(results):

    markdown_output = ""

    for ip, ports in results.items():

        markdown_output += f"#### Résultats pour l'adresse IP: {ip}\n\n"

        markdown_output += "| PORT       | STATE | SERVICE | REASON        | VERSION         |\n"

        markdown_output += "|------------|-------|---------|---------------|-----------------|\n"

        for port_info in ports:

            port, state, service, reason, version = port_info

            markdown_output += f"| {port} | {state} | {service} | {reason} | {version} |\n"

        markdown_output += "\n" 

    return markdown_output

def main():

    parser = argparse.ArgumentParser(description='Extraire les résultats Nmap et les formater en Markdown.')

    parser.add_argument('-f', '--file', required=True, help='Fichier de résultats Nmap à traiter')

    args = parser.parse_args()

    results = extract_nmap_data(args.file)

    markdown_output = generate_markdown(results)

    print(markdown_output)



if __name__ == '__main__':

    main()

