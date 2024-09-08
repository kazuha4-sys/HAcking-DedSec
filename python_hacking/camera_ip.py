import cv2

def access_camera(ip_url):
    camera = cv2.VideoCapture(ip_url)
    while True:
        ret, frame = camera.read()
        if ret:
            cv2.imshow("Camera Feed", frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    camera.release()
    cv2.destroyAllWindows()

# Exemplo de uso
access_camera("http://192.168.15.15:8000/video")
