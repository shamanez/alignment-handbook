#!/usr/bin/env bash
set -e

# Navigate to the root of the alignment-handbook project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$ROOT_DIR"

echo "==> Creating Python virtual environment with uv..."
uv venv handbook --python 3.11
source handbook/bin/activate
uv pip install --upgrade pip

echo "==> Installing PyTorch v2.6.0..."
uv pip install torch==2.6.0 --index-url https://download.pytorch.org/whl/cu126

echo "==> Installing package dependencies..."
uv pip install .

echo "==> Installing Flash Attention 2..."
uv pip install "flash-attn==2.7.4.post1" --no-build-isolation

echo "==> Logging into Hugging Face..."
huggingface-cli login

echo "==> Installing Git LFS..."
sudo apt-get install -y git-lfs

echo ""
echo "Installation complete! Check out the scripts and recipes directories to start training models."
