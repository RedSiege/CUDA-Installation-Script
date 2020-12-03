GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}\n\n[+] Updating system...\n\n${NC}"
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}\n\n[+] System updated, continuing\n\n${NC}"

echo -e "${GREEN}[+] Adding CUDA drivers...\n\n${NC}"
CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
rm -f /tmp/${CUDA_REPO_PKG}

echo -e "${GREEN}\n\n[+] Installing CUDA drivers. This may take some time...\n\n${NC}"
sudo apt update
sudo apt install cuda -y
echo -e "\n\n${GREEN}\n\n[+] CUDA installation complete\n\n${NC}"

echo -e "${GREEN}[+] Installing Hashcat and Hob0Rules\n\n${NC}"
git clone https://github.com/praetorian-inc/Hob0Rules.git
gunzip Hob0Rules/wordlists/rockyou.txt.gz 
wget https://github.com/hashcat/hashcat/archive/v6.1.1.tar.gz
tar xzf v6.1.1.tar.gz
cd hashcat-6.1.1/
make && sudo make install
echo -e "${GREEN}\n\n[+] Hashcat installation complete. Rebooting in one minute...\n\n${NC}"

sudo shutdown -r +1
