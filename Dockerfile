FROM python:3.6-alpine
MAINTAINER Keyur Sonar

ENV PYTHONUNBUFFERED 1
COPY ./requirement.txt /requirement.txt

RUN apk add build-base python-dev py-pip jpeg-dev zlib-dev
ENV LIBRARY_PATH=/lib:/usr/lib

RUN pip install -r /requirement.txt
RUN pip install Pillow

RUN mkdir /django_project
WORKDIR /django_project
COPY ./django_project /django_project

RUN python manage.py collectstatic

RUN adduser -D user
USER user
