FROM runpod/worker-comfyui:5.7.1-base
RUN cd /comfyui && git pull origin master
RUN pip install --upgrade -r /comfyui/requirements.txt

RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein/resolve/main/split_files/diffusion_models/flux-2-klein-base-4b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-base-4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein/resolve/main/split_files/diffusion_models/flux-2-klein-4b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
