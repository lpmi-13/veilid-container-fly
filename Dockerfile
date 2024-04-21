FROM ubuntu:22.04

RUN wget -O- https://packages.veilid.net/gpg/veilid-packages-key.public | gpg --dearmor -o /usr/share/keyrings/veilid-packages-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/veilid-packages-keyring.gpg] https://packages.veilid.net/apt stable main" | sudo tee /etc/apt/sources.list.d/veilid.list 1>/dev/null \
    && apt update \
    # we also install veilid-cli so we can use it when we connect remotely
    && apt install veilid-server veilid-cli

ENTRYPOINT ["veilid-server"]
