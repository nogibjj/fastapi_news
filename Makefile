install:
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt

format:
	black *.py

run:
	python main.py

run-uvicorn:
	uvicorn main:app --reload

killweb:
	sudo killall uvicorn

lint:
	pylint --disable=R,C main.py
	
test:
	python -m pytest -vv --cov=main --cov=logic test_*.py

build:
	docker build -t fastapi_news .

deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 433871218094.dkr.ecr.us-east-1.amazonaws.com
	docker build -t deployfastapi .
	docker tag deployfastapi:latest 433871218094.dkr.ecr.us-east-1.amazonaws.com/deployfastapi:latest
	docker push 433871218094.dkr.ecr.us-east-1.amazonaws.com/deployfastapi:latest

all: install format lint run build deploy test