#!/bin/bash
# updater.sh
#
# ====================== WARRANTY ====================== 
# You get no warranty of any kind and I would advise 
# you to walk away while you can. This may break the
# internet.
# ======================================================
#
# Purpose:
#  Just a simple update and parsing script to keep those
#  service records in ElasticSearch super pristine.
#
# Usage:
#  Run from within the destination directory.
#  $ bash updater.sh
#
# ...Created with infinite disdain as always. 

TMP="/tmp/iana_updateDB"
IANA="https://www.iana.org/assignments/"

PROTOCOLS="tcp udp dccp sctp"

cUp(){
  rm -rf "$TMP" 2>/dev/null
}

trap cUp SIGHUP
trap cUp EXIT 

for i in "curl jq"; do
  command -v $i >/dev/null && continue || { echo "$i command not found"; exit 1; }
done

curl -o "$TMP" "${IANA}service-names-port-numbers/service-names-port-numbers.csv"
for PRO in $PROTOCOLS; do
  cat $TMP | \
    jq --slurp --raw-input --raw-output \
      'split("\n") | .[1:] | map(split(",")) | .[] | select(.[0]!="" and .[2]=="'$PRO'" and .[1]!="") |
      "\"\(.[1])\": \(.[0])"' > iana_service_names_${PRO}.yaml
done

curl -o "$TMP" "${IANA}protocol-numbers/protocol-numbers-1.csv"
cat $TMP | \
  jq --slurp --raw-input --raw-output \
    'split("\n") | .[1:] | map(split(",")) | .[] | select(.[0]!="" and .[1]!="") | 
    "\"\(.[0])\":\(.[1])"' > iana_protocols.yaml

gzip -9 iana* iana_service_catalog.gz
exit $?
