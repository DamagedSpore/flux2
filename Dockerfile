#1
FROM runpod/worker-comfyui:5.7.1-base
RUN cd /comfyui && git pull origin master
RUN pip install --upgrade -r /comfyui/requirements.txt

COPY start.sh /start_custom.sh
RUN chmod +x /start_custom.sh

CMD ["/start_custom.sh"]
