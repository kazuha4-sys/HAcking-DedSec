import socket

def scan_ports(ip, start_port, end_port):
    open_ports = []
    for port in range(start_port, end_port + 1):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(1)
            result = s.connect_ex((ip, port))
            if result == 0:
                open_ports.append(port)
    return open_ports

if __name__ == "__main__":
    target_ip = "192.168.15.2"  # Substitua pelo IP do alvo
    ports = scan_ports(target_ip, 1, 1024)
    print(f"Portas abertas: {ports}")
