from newslib.newsgen import newsgen
from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
async def root():
    return {
        "message": "Good Morning news reader, what do you want to read today? Type in /news/{what are you interested in}"
    }


@app.get("/news/{newselement}")
async def mynews(newselement: str):
    """print news"""
    chosen_news = newsgen(newselement)
    if chosen_news == []:
        return {"We're sorry, we do not have news regarding":newselement}
    else:
        return {"Think you are interested in": chosen_news}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
