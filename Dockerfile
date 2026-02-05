FROM runpod/worker-comfyui:5.7.1-base
RUN cd /comfyui && git pull origin master
RUN pip install --upgrade -r /comfyui/requirements.txt
