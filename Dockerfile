FROM python:3.12.12-slim-trixie

# Avoid interactive prompts and speed up installs
ENV DEBIAN_FRONTEND=noninteractive

# put and install requirements
COPY ./src/requirements.txt /mnt/src/

# Set a working directory (will be mounted as volume)
WORKDIR /mnt/src

# Upgrade pip
RUN python -m \
        pip install --upgrade pip && \
    python -m \
        pip install -r requirements.txt

# Add useful shell aliases
RUN echo "alias ll='ls -la'" >> /etc/bash.bashrc

# put python code and java classes inside the container
COPY ./src/ /mnt/src/

# Keep container alive for docker exec usage
ENTRYPOINT ["python", "main.py"]

