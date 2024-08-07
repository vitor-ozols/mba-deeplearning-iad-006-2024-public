# Use a imagem base do Python
FROM python:3.9-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie os arquivos necessários para o diretório de trabalho
COPY . /app

# Instale as dependências necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Exponha a porta que o Flask usará
EXPOSE 5000

# Defina a variável de ambiente para o Flask
ENV FLASK_APP=app.py

# Comando para iniciar a aplicação
CMD ["flask", "run", "--host=0.0.0.0"]
