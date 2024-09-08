from scapy.all import sniff

def NetworkTrafficMonitor(interface):
    def packet_callback(packet):
        print(f"Packet: {packet.summary()}")

    sniff(iface=interface, prn=packet_callback, store=0)

# Exemplo de uso
NetworkTrafficMonitor("eth0")
