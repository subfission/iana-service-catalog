# IANA Service Catalog
This is an auto-generated catalog of IANA services prepared for ElasticSearch ingestion. Records are parsed, normalized, and stored into YML files.

You can write a shell script to check for updates weekly, download, and plop them into your Logstash config.

# Breakdown

    iana-service-catalog 
    ├── LICENSE
    ├── README.md
    └── depot
      ├── iana_protocols.yaml          : All named protocols
      ├── iana_service_names_dccp.yaml : All DCCP protocols
      ├── iana_service_names_sctp.yaml : All SCTP protocols
      ├── iana_service_names_tcp.yaml  : ALL TCP protocols
      └── iana_service_names_udp.yaml  : All UDP protocols

## Reference Material
- [DCCP](https://en.wikipedia.org/wiki/Datagram_Congestion_Control_Protocol)
- [SCTP](https://en.wikipedia.org/wiki/Stream_Control_Transmission_Protocol)
- [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol)
- [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol)
- [IANA Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml)
