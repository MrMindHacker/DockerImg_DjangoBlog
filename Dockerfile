FROM python:3.6-alpine
MAINTAINER Keyur Sonar

ENV PYTHONUNBUFFERED 1
COPY ./requirement.txt /requirement.txt

RUN pip install pillow

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
