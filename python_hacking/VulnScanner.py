import requests

def check_vulnerability(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            print(f"{url} está respondendo.")
        else:
            print(f"{url} não está respondendo.")
    except requests.RequestException as e:
        print(f"Erro ao acessar {url}: {e}")

# Exemplo de uso
check_vulnerability("http://example.com")
