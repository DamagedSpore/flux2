#!/bin/bash
CACHE_DIR=$(find /runpod-volume/huggingface-cache/hub/models--Comfy-Org--flux2-klein/snapshots -maxdepth 1 -mindepth 1 -type d | head -1)

if [ -n "$CACHE_DIR" ]; then
    ln -sf "$CACHE_DIR"/split_files/diffusion_models/* /comfyui/models/diffusion_models/
    ln -sf "$CACHE_DIR"/split_files/text_encoders/* /comfyui/models/text_encoders/
    ln -sf "$CACHE_DIR"/split_files/vae/* /comfyui/models/vae/
fi

exec /start.sh
