from newslib.newsgen import newsgen

def test_newsgen(newselement):
    news = newsgen(newselement)
    #make sure we're generating news
    assert newselement in news