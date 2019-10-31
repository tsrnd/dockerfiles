FROM python:3.8-alpine
COPY . /srv/flask_app
WORKDIR /srv/flask_app
RUN apk add --no-cache bash git nginx uwsgi uwsgi-python3 && \
	pip3 install --upgrade pip && \
	pip3 install flask
RUN pip3 install -r ./requirements.txt --src /usr/local/src
COPY ./nginx /etc/nginx
RUN chmod +x ./start.sh
CMD ["./start.sh"]