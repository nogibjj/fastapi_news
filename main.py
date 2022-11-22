from newslib.newsgen import newsgen
from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello Atlantic"}


@app.get("/news/{newselement}")
async def mynews(newselement: str):
    """print news"""
    chosen_news = newsgen(newselement)
    return {"Relevant News": chosen_news}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
