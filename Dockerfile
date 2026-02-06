FROM runpod/worker-comfyui:5.7.1-base
RUN cd /comfyui && git pull origin master
RUN pip install --upgrade -r /comfyui/requirements.txt
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z-image-turbo_fp8_scaled_e4m3fn_KJ.safetensors --relative-path models/diffusion_models --filename z-image-turbo_fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
