# News Generator Microservice via FastAPI & AWS AppRunner
[![Python application test with Github Actions](https://github.com/nogibjj/fastapi_news/actions/workflows/main.yml/badge.svg)](https://github.com/nogibjj/fastapi_news/actions/workflows/main.yml) ![AWS Code Build](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiZnA3WWxJZFJhdHdzMTFLSVIzd3dIK3IwY0dkOG5IcmFpTEgyTDRxQ1JWTitSRWJyUFZ5TFBRVFVqb1RTQm9pQ3RKb2hJcFhrcDMzYkMxcCtIeXRObXZrPSIsIml2UGFyYW1ldGVyU3BlYyI6IklBSXZXSTJ6UlZLLzVvR3giLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

## Project4 Workflow diagram
![project4_diagram](https://user-images.githubusercontent.com/112578755/204114921-dd0ffe8f-923a-4749-b7fd-313f9efc369b.jpg)

# Containerized FastAPI

`docker build .`

`docker run -p 127.0.0.1:8080:8080 378c80e24481`

# Project purpose:

The project aims to build a Microservice that is able to reuturn JSON payload, and perform Continuous Integration through Github Actions and configure Build Server to deploy changes on build (Continuous Delivery) using FastAPI, AWS apprunner and Code Build. 

More specifically, the project can generate news for readers based on what they are interested in. The data is scraped via Atlantic news website. It will return a JSON payload containing the news that are relevant to what users want to read. 

# Project process:
1. News was obtained from Atlantic News website using requests and beautifulsoup package in Python.
2. FastAPI was leveraged to display the concerning news articles
3. Using Cloud9 as the environment, the microservice was containerized in AWS ECR and pushed to production using AppRunner
4. Continuous Delivery was performed using AWS CodeBuild. (via buildspec.yml)
5. Continous Integration was enabled via Github Actions.


# Deployed domain 
`https://fsph22snqi.us-east-1.awsapprunner.com/ `

# Example Output
- for address `https://fsph22snqi.us-east-1.awsapprunner.com/news/abortion`
<img width="1201" alt="Screen Shot 2022-11-26 at 9 28 41 PM" src="https://user-images.githubusercontent.com/112578755/204116541-76fdb77c-fcf8-4140-b89e-ac92d9d6ef03.png">

