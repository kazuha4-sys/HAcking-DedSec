from scapy.all import *

def http_packet_callback(packet):
    if packet.haslayer(IP) and packet.haslayer(TCP) and packet.haslayer(Raw):
        payload = packet[Raw].load.decode(errors='ignore')
        if "HTTP" in payload:
            print(payload)

def monitor_http_traffic():
    sniff(prn=http_packet_callback, filter="tcp port 80", store=0, iface="any")

if __name__ == "__main__":
    monitor_http_traffic()
