sudo apt update
sudo apt install r-base r-base-dev -y
sudo apt-get install libclang-dev libcurl4-openssl-dev libssl-dev libxml2-dev libudunits2-dev libgdal-dev cargo libfontconfig1-dev libcairo2-dev -y

# Install RStudio (evtl. update URL)
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.12.1-402-amd64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
