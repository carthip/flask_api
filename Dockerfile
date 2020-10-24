FROM python:3.6.4
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

# sudo docker run --name flask-api -d -p 8080:8080 --rm flask-api

#  sudo docker build --tag flask-api .
