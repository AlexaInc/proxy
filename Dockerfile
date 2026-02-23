# Use Alpine Linux for a tiny footprint
FROM alpine:latest

# Install tinyproxy
RUN apk add --no-cache tinyproxy

# Copy your config file (make sure to create this in your repo)
# Ensure 'Allow 0.0.0.0/0' is in your tinyproxy.conf to accept traffic
## tinyproxy.conf

# Port to listen on
Port 8888

# Listen on all interfaces
Listen 0.0.0.0

# Timeout for connections
Timeout 600

# Essential: Allow Koyeb's health checks and public traffic
# Without this, Tinyproxy will reject all connections (403 Forbidden)
Allow 0.0.0.0/0

# Logging (Set to Critical to keep logs clean on Koyeb)
LogLevel Critical

# Disable the Via header for privacy
DisableViaHeader Yes
# Expose the default port
EXPOSE 8888

CMD ["tinyproxy", "-d"]
