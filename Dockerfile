# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.7.1-base

# install custom nodes into comfyui
# Could not resolve unknown custom node MarkdownNote (unknown_registry entry has no aux_id) - skipped

# download models into comfyui
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-base-4B/resolve/main/flux-2-klein-base-4b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-base-4b.safetensors
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-4B/resolve/main/flux-2-klein-4b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
