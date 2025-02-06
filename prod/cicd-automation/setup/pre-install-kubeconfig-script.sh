# First, exec into jenkins pod installed inside Cluster

# Download the latest stable version of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make the kubectl binary executable
chmod +x kubectl

# Move kubectl to a directory in your PATH (e.g., /usr/local/bin)
mv kubectl /usr/local/bin/

# Verify the installation
kubectl version --clients