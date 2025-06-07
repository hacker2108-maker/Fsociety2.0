#!/bin/bash

# quick installer for SET with automatic virtual environment creation

echo "[*] Creating and activating Python virtual environment..."
python3 -m venv Fsociety-venv
source Fsociety-venv/bin/activate

echo "[*] Installing requirements.txt..."
pip3 install -r requirements.txt

echo "[*] Installing setoolkit to /usr/local/share/setoolkit"
mkdir -p /usr/local/share/setoolkit/
mkdir -p /etc/setoolkit/
cp -rf * /usr/local/share/setoolkit/
cp src/core/config.baseline /etc/setoolkit/set.config

echo "[*] Creating launcher for setoolkit..."
cat > /usr/local/bin/setoolkit << 'EOF'
#!/bin/bash
source /usr/local/share/setoolkit/setoolkit-venv/bin/activate
cd /usr/local/share/setoolkit
./setoolkit
EOF

echo "[*] Done. Chmoding +x.... "
chmod +x /usr/local/bin/setoolkit

echo "[*] Finished. Run 'Fsociety' to start the Social Engineer Toolkit."
