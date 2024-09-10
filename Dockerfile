 FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl vim git wget && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["bash"]
