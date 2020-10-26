FROM python:3.6-slim
COPY . /flask_api
WORKDIR /flask_api
RUN pip install -r requirements.txt
RUN chmod +x ./entrypoint.sh
EXPOSE 5000
ENTRYPOINT [ "sh", "-x", "entrypoint.sh" ]

#ENTRYPOINT ["gunicorn app:app"]

#ENTRYPOINT [ "sh", "-x", "entrypoint.sh" ]

#sudo docker run --name flask-api -d -p 8080:8080 --rm flask-api

#sudo docker build --tag flask-api .

#sudo docker build --tag flask-api_gunicorn .

#sudo docker run --name flask-api_gunicorn -d -p 8000:8000 --rm flask-api_gunicorn

#flask-api_gunicorn:latest
