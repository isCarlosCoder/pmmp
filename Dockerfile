# Usar uma imagem base do Debian
FROM debian:bullseye-slim

# Definir o diretório de trabalho
WORKDIR /srv/pocketmine

# Atualizar pacotes e instalar dependências necessárias (PHP, git, etc.)
RUN apt-get update && apt-get install -y \
    php7.4-cli \
    php7.4-curl \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    git \
    bash \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Copiar todos os arquivos do seu projeto para dentro do container
COPY . /srv/pocketmine

# Garantir que o start.sh tenha permissão de execução
RUN chmod +x /srv/pocketmine/start.sh

# Expor a porta 19133 (porta padrão do PocketMine)
EXPOSE 19133

# Comando para rodar o servidor com o start.sh
CMD ["bash", "start.sh"]
