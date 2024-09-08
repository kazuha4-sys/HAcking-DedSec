import socket

def PortExplorer(ip):
    open_ports = []
    for port in range(1, 1024):  # Scans common ports
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(1)
        result = sock.connect_ex((ip, port))
        if result == 0:
            open_ports.append(port)
        sock.close()
    return open_ports
