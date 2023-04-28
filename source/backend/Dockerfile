# Utilizza l'immagine ufficiale di Ruby come base
FROM ruby:2.7

# Installa le dipendenze del sistema necessarie per Rails e PostgreSQL
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Crea una directory per l'applicazione e impostala come directory di lavoro
RUN mkdir /myapp
WORKDIR /myapp

# Copia il file Gemfile e Gemfile.lock dell'applicazione nella directory di lavoro
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Installa le gemme specificate nel Gemfile
RUN bundle install

# Copia il codice dell'applicazione nella directory di lavoro
COPY . /myapp

# Espone la porta 3000 dell'applicazione
EXPOSE 3000

ENV BACKEND_DATABASE_USER=admin \
    BACKEND_DATABASE_PASSWORD=password \
    RAILS_MASTER_KEY=4c61fe7c0395dc5e96de25ed0f093a4f \
	RAILS_ENV=production

# Esegui il comando "rails server" quando si avvia il container
CMD ["rails", "server", "-b", "0.0.0.0"]
