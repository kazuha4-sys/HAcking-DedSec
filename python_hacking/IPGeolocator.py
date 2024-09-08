import requests

def IPGeolocator(ip):
    response = requests.get(f"https://ipinfo.io/{ip}/json")
    data = response.json()
    return data

# Exemplo de uso
ip_data = IPGeolocator("192.168.15.2")
print(ip_data)
