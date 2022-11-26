from newslib.newsgen import newsgen
import requests
from bs4 import BeautifulSoup


def test_newsgen(newselement):
    news = newsgen(newselement)
    # make sure we're generating news
    assert newselement in news
