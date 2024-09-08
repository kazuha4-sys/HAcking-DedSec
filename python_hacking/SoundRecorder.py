import pyaudio
import wave

def record_audio(seconds, output_file):
    chunk = 1024
    format = pyaudio.paInt16
    channels = 1
    rate = 44100
    frames = []

    p = pyaudio.PyAudio()
    stream = p.open(format=format, channels=channels, rate=rate, input=True, frames_per_buffer=chunk)

    print("Gravando...")
    for _ in range(0, int(rate / chunk * seconds)):
        data = stream.read(chunk)
        frames.append(data)

    print("Gravação finalizada.")
    stream.stop_stream()
    stream.close()
    p.terminate()

    wf = wave.open(output_file, 'wb')
    wf.setnchannels(channels)
    wf.setsampwidth(p.get_sample_size(format))
    wf.setframerate(rate)
    wf.writeframes(b''.join(frames))
    wf.close()

# Exemplo de uso
record_audio(5, "audio.wav")
