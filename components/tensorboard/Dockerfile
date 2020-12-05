FROM python:3.7.9-slim-stretch

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && rm ./requirements.txt
