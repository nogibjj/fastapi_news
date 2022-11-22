# FROM alpine:latest
# RUN apk update && apk add bash

# RUN mkdir -p /app
# COPY . main.py /app/
# WORKDIR /app
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt
# EXPOSE 8080
# CMD [ "main.py" ]
# ENTRYPOINT [ "python" ]
FROM public.ecr.aws/lambda/python:3.8

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8080
CMD [ "main.py" ]
ENTRYPOINT [ "python" ]