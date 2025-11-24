FROM python:3.11-slim

WORKDIR /app

# Install required Python packages
RUN pip install --no-cache-dir prometheus-client requests

# Copy the exporter script and wrapper
COPY pihole6_exporter /usr/local/bin/pihole6_exporter
COPY exporter-wrapper.sh /usr/local/bin/exporter-wrapper.sh
RUN chmod +x /usr/local/bin/pihole6_exporter /usr/local/bin/exporter-wrapper.sh

# Default environment variables
ENV PIHOLE_HOST=localhost
ENV PIHOLE_PORT=9617
ENV PIHOLE_HTTP_PORT=80

# Expose metrics port
EXPOSE 9617

# Run the wrapper script
CMD ["/usr/local/bin/exporter-wrapper.sh"]
