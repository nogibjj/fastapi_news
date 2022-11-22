install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_main.py

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

	
build:
	docker build -t deploy-fastapi .

deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
	docker build -t deploy-fastapi .
	docker tag deploy-fastapi:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/deploy-fastapi:latest
	docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/deploy-fastapi:latest

all: install format lint test run build deploy