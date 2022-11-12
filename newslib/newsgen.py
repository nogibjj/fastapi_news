import requests
from bs4 import BeautifulSoup


def newsgen(newselement):
# Fetch the web page
    url = "https://www.theatlantic.com"
    r = requests.get(url)
    # Feed page into BeautifulSoup
    soup = BeautifulSoup(r.text, "html.parser")

    news_urls = []
    for link in soup.find_all('a'):
        link_url = link.get('href')
        #Discard "None"
        if link_url:
            if "magazine/archive/2022" in link_url:
                news_urls.append(link_url)

    one_url = news_urls[0]
    res_one_url = requests.get(one_url)
    soup_one_url = BeautifulSoup(res_one_url.content, 'html.parser')

    lines = soup_one_url.text
    res2 = lines.split(",")
    key_line = []
    for line in res2:
        if newselement in line:
            key_line.append(line)

    return key_line