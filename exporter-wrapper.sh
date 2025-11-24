#!/bin/bash

# Use PIHOLE_HTTP_PORT environment variable, default to 80
PIHOLE_HTTP_PORT=${PIHOLE_HTTP_PORT:-80}

# Modify the script to use the correct port and protocol
sed -i "s|https://\" + self.host + \":443|http://\" + self.host + \":${PIHOLE_HTTP_PORT}|g" /usr/local/bin/pihole6_exporter

# Run the exporter
exec /usr/local/bin/pihole6_exporter -H ${PIHOLE_HOST} -p ${PIHOLE_PORT} ${PIHOLE_KEY:+-k ${PIHOLE_KEY}}
