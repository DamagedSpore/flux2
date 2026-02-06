FROM runpod/worker-comfyui:5.7.1-base
RUN cd /comfyui && git pull origin master
RUN pip install --upgrade -r /comfyui/requirements.txt
# FP8 диффузионная модель (~6 ГБ) — из репо T5B
RUN comfy model download --url https://huggingface.co/T5B/Z-Image-Turbo-FP8/resolve/main/z-image-turbo-fp8-e4m3fn.safetensors --relative-path models/diffusion_models --filename z-image-turbo-fp8-e4m3fn.safetensors
# Text encoder — из Comfy-Org
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
# VAE — из Comfy-Org
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
