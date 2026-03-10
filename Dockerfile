# Usando a imagem base do Node.js 22 (Precisa ser a 22, pois a 22-alpine não suporta a execução mongodb-memory-server)
FROM node:24-alpine

ENV NODE_ENV=production

# Cria a pasta de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copia os arquivos de dependências para dentro do contêiner
COPY package.json package-lock.json ./

# Instala apenas dependências de produção
RUN npm ci

# Copia todo o código da aplicação para o contêiner
COPY . .

# Expõe a porta da API (variável API_PORT, padrão 3001)
EXPOSE 3001

# Comando para rodar a aplicação dentro do container
CMD [ "node", "server.js" ]
