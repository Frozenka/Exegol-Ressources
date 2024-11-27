#!/bin/bash

read -p "Entrez le DNS : " DNS

dnsvalidator -tL 'https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt' -threads 50 -o /tmp/resolvers.txt &
PID=$!
echo "Attente de la création de /tmp/resolvers.txt..."
while [ ! -f /tmp/resolvers.txt ]; do
  sleep 1
done
echo "Surveillance de la génération de résolveurs..."
while true; do
  LINE_COUNT=$(wc -l < /tmp/resolvers.txt)
  if [ "$LINE_COUNT" -ge 50 ]; then
    echo "50 résolveurs atteints, arrêt de dnsvalidator."
    kill "$PID"
    break
  fi
  sleep 1
done
AMASS_CMD="amass enum -d $DNS -brute -alts -w /opt/seclists/Discovery/DNS/n0kovo_subdomains.txt -min-for-recursive 2 -dns-qps 3000 -v -rf /tmp/resolvers.txt -o /tmp/domains.txt"
echo "Lancement de la commande amass avec les paramètres suivants :"
echo "$AMASS_CMD"
eval "$AMASS_CMD"
