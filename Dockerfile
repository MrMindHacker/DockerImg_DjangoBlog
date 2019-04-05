FROM python:3.6-alpine
MAINTAINER Keyur Sonar

ENV PYTHONUNBUFFERED 1
COPY ./requirement.txt /requirement.txt

RUN pip install -r /requirement.txt

RUN mkdir /django_project
WORKDIR /django_project
COPY ./django_project /django_project

RUN adduser -D user
USER user
