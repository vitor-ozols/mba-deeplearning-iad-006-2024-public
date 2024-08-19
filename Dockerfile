FROM python:3.9-slim

WORKDIR /

COPY . /

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Especificar a porta 8080 no comando do Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
