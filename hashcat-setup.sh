GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Updating system...\n\n${NC}"
sudo su
apt update && apt upgrade -y
echo -e "${GREEN}\n\n[+] System updated, continuing\n\n${NC}"

echo -e "${GREEN}[+] Adding CUDA drivers...\n\n${NC}"
CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
dpkg -i /tmp/${CUDA_REPO_PKG}
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
rm -f /tmp/${CUDA_REPO_PKG}

echo -e "${GREEN}[+] Installing CUDA drivers. This may take some time...\n\n${NC}"
apt update
apt install cuda-drivers
echo -e "${GREEN}\n\n[+] CUDA installation complete\n\nRebooting in 1 minute\n\n${NC}"

shutdown -r +1
