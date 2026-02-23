# Use Alpine Linux for a tiny footprint
FROM alpine:latest

# Install tinyproxy
RUN apk add --no-cache tinyproxy

# Copy your config file (make sure to create this in your repo)
# Ensure 'Allow 0.0.0.0/0' is in your tinyproxy.conf to accept traffic
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Expose the default port
EXPOSE 8888

CMD ["tinyproxy", "-d"]
