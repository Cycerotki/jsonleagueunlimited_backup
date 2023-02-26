FROM python:3.10.10-slim-buster

#using root access
USER root

#set environment to singapore and update local time
ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 libgl1 -y

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install libraries
ADD requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
# RUN pip3 install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu116

# Setup container directories
RUN mkdir /app

# Copy local code to the container
COPY ./app /app

# launch server with gunicorn
WORKDIR /app
EXPOSE 8080
CMD ["gunicorn", "main:app", "--timeout=0", "--preload", \
     "--workers=1", "--threads=4", "--bind=0.0.0.0:8080"]