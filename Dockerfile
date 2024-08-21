# Use uma imagem oficial do Python 3.9 com tamanho reduzido
FROM python:3.9-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie apenas os arquivos necessários para o container
COPY requirements.txt ./

# Instale as dependências listadas no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copie a pasta models e o restante dos arquivos da aplicação
COPY models/ ./models/
COPY . .

# Exponha a porta 8080 para acesso externo
EXPOSE 8000

# Configure variáveis de ambiente para a aplicação Flask
ENV FLASK_APP=./app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8000

# Comando para iniciar a aplicação Flask, vinculando à porta 8080
CMD ["flask", "run", "--host=0.0.0.0", "--port=8000"]
