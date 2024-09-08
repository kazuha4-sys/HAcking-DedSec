import requests
from bs4 import BeautifulSoup

def WebScraper(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    return soup.title.string

# Exemplo de uso
print(WebScraper("https://jarvis-assistente-virtual.netlify.app/"))
