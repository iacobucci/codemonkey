# Usa un'immagine di base con TeX Live incluso
FROM texlive/texlive:latest

# Copia il tuo script di installazione dei pacchetti nel container (assicurati che 'install-packages.sh' sia presente nella tua directory)
COPY install_packages.sh /tmp/

# Rendi eseguibile lo script e installa i pacchetti richiesti
RUN chmod +x /tmp/install_packages.sh && \
    /tmp/install_packages.sh

# Crea la directory del progetto nel container
RUN mkdir /project

COPY . /project

# Imposta la directory di lavoro
WORKDIR /project

# Comando per compilare il progetto LaTeX quando il container viene eseguito
ENTRYPOINT ["pdflatex", "-interaction=nonstopmode", "-output-directory=./output", "./codemonkey.tex"]