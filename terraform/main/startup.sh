#!/bin/bash
set -euo pipefail

# Update package information
apt update

# Install required packages
apt -y install nginx-light wget default-mysql-client

# Download and install Cloud SQL Proxy
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/bin/cloud_sql_proxy
chmod +x /usr/bin/cloud_sql_proxy

# Fetch instance metadata
NAME=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/name")
IP=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip")

# Fetch connection name from Secret Manager and decode it
CONNECTION_NAME=$(gcloud secrets versions access latest --secret="connection-name" --format='get(payload.data)' | tr '_-' '/+' | base64 -d)

# Create an HTML file with instance information
cat <<EOF > /var/www/html/index.html
<html>
   <body>
      <p>Hello World!</p>
      <p>The current version is: V1.0</p>
      <p>My name is: $NAME</p>
      <p>My internal IP is: $IP</p>
      <p>Copy the two lines of code, and paste into your SSH session to connect to the database.</p>
      <pre>
        <code>
        cloud_sql_proxy -instances=$CONNECTION_NAME=tcp:3306  &
        mysql -u user  --host 127.0.0.1 --port 3306 -p
        </code>
      </pre>
   </body>
</html>
EOF
