import subprocess

def get_network_name():
    try:
        # Executa o comando para obter o nome da rede Wi-Fi
        result = subprocess.run(['netsh', 'wlan', 'show', 'interfaces'], capture_output=True, text=True)
        output = result.stdout

        # Procura a linha que contém o nome da rede (SSID)
        for line in output.splitlines():
            if "SSID" in line:
                # Retorna o SSID, removendo espaços em branco
                return line.split(":")[1].strip()

        return "Desconhecida"
    except Exception as e:
        return "Desconhecida"

def ping_device(ip):
    try:
        # Executa o comando ping com 1 pacote ICMP
        result = subprocess.run(['ping', '-n', '1', ip], capture_output=True, text=True)
        if "TTL" in result.stdout:
            return True
        else:
            return False
    except Exception as e:
        return False

def scan_network(network_prefix):
    print(f"Rede Wi-Fi: {get_network_name()}")
    for i in range(1, 255):
        ip = network_prefix + str(i)
        if ping_device(ip):
            print(f"Dispositivo ativo: {ip}")

if __name__ == "__main__":
    network_prefix = "192.168.15."
    scan_network(network_prefix)
