import zipfile

def crack_zip(zip_file, wordlist):
    zip = zipfile.ZipFile(zip_file)
    with open(wordlist, "r") as f:
        for word in f:
            word = word.strip()
            try:
                zip.extractall(pwd=bytes(word, 'utf-8'))
                print(f"Senha encontrada: {word}")
                return
            except:
                continue
    print("Senha não encontrada.")

# Exemplo de uso
crack_zip("arquivo_secreto.zip", "wordlist.txt")
