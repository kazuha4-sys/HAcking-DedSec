import socket

def send_key_to_server(ip, port=5555):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((ip, port))

    print(f"[DEDSEC]: Conectado ao servidor {ip}. Digite 'exit' para sair.")

    while True:
        key = input("Digite a tecla a ser pressionada no computador remoto: ")
        client_socket.send(key.encode("utf-8"))
        if key.lower() == "exit":
            break

    client_socket.close()

if __name__ == "__main__":
    server_ip = input("Digite o IP do computador que você deseja controlar: ")
    send_key_to_server(server_ip)
