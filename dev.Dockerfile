FROM python:3.7.6-alpine

RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev && \
    apk add netcat-openbsd

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY ./requirements/prod.txt requirements/prod.txt
RUN pip install --r requirements/prod.txt

RUN mkdir bin
COPY ./bin/entrypoint.sh bin/entrypoint.sh
RUN chmod +x bin/entrypoint.sh

COPY . .
