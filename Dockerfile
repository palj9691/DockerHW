Dockerfile Jenkinsfile app

FROM ubuntu:xeniual
LABEL mainainer=""
LABEL email=""

EXPOSE 8080

RUN apt-get update && \
	apt-get install python-pip -y && \
	apt-get install python-dev -y
	
COPY app/* /app/

WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT["python"]
CMD["site.py"]
