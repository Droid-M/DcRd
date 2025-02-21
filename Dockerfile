# Usando uma imagem oficial do Python como base
FROM python:3.11-slim

# Definição do diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências primeiro para otimizar o cache do Docker
COPY source/requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para o contêiner
COPY source/ .

# Define o comando padrão ao rodar o contêiner
CMD ["python", "main.py"]
