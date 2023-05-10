docs
    [x] abstract
    analisi dei requisiti   
        [x] vocabolario
        [x] scenari
        [x] analisi del rischio
    analisi del probelma
        [\] analisi delle funzionalità
        [ ] analisi ruoli e responsabilità
        [ ] analisi de dominio
        [ ] architettura logica
            [ ] struttura
            [ ] interazione
        [ ] piano di lavoro
    progettazione
        [x] scelte tecnologiche
        [ ] progettazione architetturale
            [x] client (frontend)
            [x] server (backend)
            [x] persistenza (database)
        [ ] collaudo (test)
        deployment
            [x] containerizzazione
            [ ] deploy

    roba da limare
        [ ] req funz e non funz post analisi sicurezza aggiornati
        [ ] casi d'uso aggiornati(aggiungiamo il log?)
        [ ] se punto sopra c'é da fare anche lo scenario del log

res
	[ ] capire come ottenere parametri da componente genitore
	[x] modellare tabelle con rails db:migration
    [x] activerecord
    [x] sti
    [x] project references codemonkey/company
    [ ] model azione
    [ ] capire se progetto rifiutato da codemonkey cosa fare
        notifica a company
    
misc
    frontend
        [x] toolbar
            [x] bug scrolling viewport
        [x] theme
            [x] dark mode
            [x] light mode
            [x] colors
                [x] accent
                [x] primary
        [x] login
            [x] salvataggio stato con JWT
            [ ] bug forward a /feed
        [x] registrazione
            [x] matching passwords
            [x] qr code
                [x] bug libreria

    backend
        [x] database connection
        [x] ActiveRecord
        [x] 2FA totp
        [x] JWT
            [ ] architettura sistema di permessi
                jwt -> user -> codemonkey | company | admin -> azione

    database
        [ ] rails migration
        
db
    [x] timestamps di creazione
    [x] timestamps di update
    entity
        [ ] user 1:1
            [ ] username
                primary key varchar(255)
            [ ] password_digest
                varchar(255)
            [ ] totp_secret
                varchar(255)
            [ ] email
                varchar(255)
            [ ] tipo
                enum (codemonkey, company, admin)

        [ ] codemonkey 1:1
            [ ] username
                primary key varchar(255) foreign key to user
            [ ] email
                varchar(255)
            [ ] nome
                varchar(255)
            [ ] bio
                varchar(4095)
            [ ] propic
                blob
            [ ] stato
                enum (attivo, bannato)

            [ ] cognome
                varchar(255)
            [ ] valutazione_media
                int null
                    
        [ ] company 1:1
            [ ] username
                primary key varchar(255) foreign key to user
            [ ] email
                varchar(255)
            [ ] nome
                varchar(255)
            [ ] bio
                varchar(4095)
            [ ] propic
                blob
            [ ] stato
                enum (attivo, bannato)

        [ ] admin 1:1
            [ ] username
                primary key varchar(255) foreign key to user

        [ ] tecnologia
            [ ] id
                primary key int autoincrement
            [ ] nome
                varchar(255)
            [ ] data_suggerimento
                datetime
            [ ] username
                foreign key a user
            [ ] approvata
                boolean
            [ ] rifiutata
                boolean

    relation
        [ ] lavoro 1:N
            [ ] id
                primary key int autoincrement
            [ ] titolo
                varchar(255)
            [ ] descrizione
                varchar(4095)

            [ ] data_proposta
                datetime

            [ ] data_inizio
                date

            [ ] data_fine
                date
            [ ] valutazione
                int null
            [ ] commento
                varchar(1024)
                
            [ ] codemonkey
                foreign key a codemonkey
            [ ] company
                foreign key a company
            [ ] tecnologie
                foreign key a tecnologie
        
        [ ] lavori_tecnologie N:N
            [ ] lavoro
                foreign key a lavoro
            [ ] tecnologia
                foreign key a tecnologia
        
        [ ] codemonkey_tecnologie N:N
            [ ] username
                foreign key a codemonkey
            [ ] tecnologia
                foreign key a tecnologia

        [ ] aziende_tecnologie N:N
            [ ] username
                foreign key a company
            [ ] tecnologia
                foreign key a tecnologia
        
        [ ] report_user N:N
            [ ] username_from
                foreign key a user
            [ ] username_to
                foreign key a user
            [ ] data
                datetime
            [ ] descrizione
                varchar(1024)

        [ ] azioni 1:N
            [ ] id
                primary key int autoincrement
            [ ] nome
                varchar(255)
            [ ] data
                datetime
            [ ] descrizione
                varchar(8191)
                    codemonkey
                        signup
                        login
                        logout
                        delete
                        accept?project=<project.id>
                        reject?project=<project.id>
                        settings?nome=password&<nome>&cognome=<cognome>&bio=<bio>&propic=<propic>&email=<email>&tecnologie=<tecnologia1,tecnologia2,...>
                        suggest?tecnologia=<tecnologia>
                        report?[codemonkey=<codemonkey.username>||company=<codemonkey.username>]
                    company
                        signup
                        login
                        logout
                        new?title=<project.id>&codemonkey=<codemonkey.username>&descrizione=<descrizione>&tecnologie=<tecnologia1,tecnologia2,...>
                        terminate?project=<project.id>
                        settings?nome=password&<nome>&bio=<bio>&propic=<propic>&email=<email>&tecnologie=<tecnologia1,tecnologia2,...>
                        suggest?tecnologia=<tecnologia>
                        report?[codemonkey=<codemonkey.username>||company=<codemonkey.username>]
                    admin
                        login
                        logout
                        set?[codemonkey=<codemonkey.username>||company=<codemonkey.username>]&stato=<attivo|bannato|sospeso>
                        add?tecnologia=<tecnologia>
                        approve?tecnologia=<tecnologia>
                        rifiuta?tecnologia=<tecnologia>
                        
            [ ] username
                foreign key a user
                    user che invoca l'azione
                        codemonkey
                        company
                        admin

model
    user
        codemonkey
        company
        admin
    
    project
    action 
    technology
    report

endpoint
	public
		[ ] /api/signup
			1 frontend fa richiesta
				parametri
					tipo=<codemonkey|company>
					username
                    [ ] controllo caratteri
                        abcdefghijklmnopqrstuvwxyz0123456789_
					email
					password
					password_confirmation
                    [x] se password!=password_confirmation
                        messaggio di errore
			2 backend interroga il database se username è gia presente in tabella user
                [ ] controllo caratteri username
                    abcdefghijklmnopqrstuvwxyz0123456789_
                se non valido
                    error json
                        3 invia error json
                            {"error":"username_non_valido"}
				se presente
					error json
						3 invia error json
                            {"error":"username_gia_presente"}
				se non presente
					crea un password_digest
					fa insert in database
						se tipo==codemonkey
							inserisce in user
								username
								tipo=codemonkey
								password_digest
							inserisce in tabella codemonkey
								username
								email
						se tipo==company
							inserisce in user
								username
								tipo=company
								password_digest
							inserisce in tabella company
								username
								email
			3 backend genera un secret TOTP e un JWT e li invia al frontend
                viene fatto /api/login in automatico
                    {"otp_provisioning_uri":"
        otpauth://totp/<username>?secret=<secret>&issuer=Codemonkey&algorithm=sha1&digits=6&period=30", "username":"<username>", "tipo":"<tipo>", "jwt":"<jwt>"}
				salvataggio azione nei log
					datetime=Time.now
					user=<username>
					nome=registrazione
					descrizione=""
					
			4 frontend analizza la risposta
				se error json
					mostra dialog.errore.registrazione.messaggio = username gia usato
				se payload json
					mostra dialog.registrazione
						messaggio = registrato con successo
						qrdata = payload.totp
							disegna a schermo qrcode che l'utente può scansionare

				login automatico
					
				se codemonkey
					forward a /codemonkey/<username>/modifica
				se company
					forward a /company/<username>/modifica
		
		[ ] /api/login
			1 frontend fa richiesta
				parametri
					username
					password
					totp

			2 backend interroga database se (username, password_digest) coincidono, poi devo capire cosa cavolo fa la libreria che ho installato
				se non corretto
					3 invia error json

			3 backend genera un jwt e payload json e lo invia al frontend
				{"username":"username","tipo":"codemonkey|company|admin","jwt":"<payload.jwt>"}
				salvataggio azione nei log
					datetime=Time.now
					user=<username>
					nome=login
					descrizione=""

			4 frontend salva payload in localStorage 

		[ ] /api/feed
			1 frontend fa richiesta con parametri
				tipo=<tutti|codemonkey|company>
				teconologie=<tecnologia1.id,tecnologia2.id>
			2 backend interroga il database con una query filtrante
				se tipo=tutti
                se tipo=codemonkey
                se tipo=company
			3 backend invia i risultati
				success
					json payload
				error
					json error
			4 il frontend analizza la risposta
				se payload
					crea i componenti e visualizza
				se error
					mostra dialog.errore.richiesta.messaggio = "errore nel contattare il server"
                    
        [ ] /api/user
            1 frontend fa richiesta
                parametri
                    username

        [ ] /api/lavoro
            1 frontend fa richiesta
                parametri
                    id

	auth
		[ ] /api/logout
			1 frontend fa richiesta con http interceptor 
				parametri
					username

			2 backend interroga il database se <username> esiste
				se non corretto
					3 invia error json
                        {"error":"username_non_valido"}

			3 backend contolla se azione è permessa
				salvataggio azione nei log
					datetime=Time.now
					user=<username>
					nome=logout
					descrizione=""
                genera payload
                    {"logout":"ok"}

			4 frontend analizza la risposta
                se error json
                    mostra dialog.errore.logout.messaggio = "errore nel contattare il server"
                se payload json
                    elimina username da localStorage
                    elimina jwt da localStorage    
                    elimina tipo da localStorage
                    forward a /feed
        
        [ ] /api/report

		[ ] /api/dashboard
        
        [ ] /api/azione

		[ ] /api/user/modifica
        
        [ ] /api/lavoro/modifica



componenti
    [ ] card
        [ ] codemonkey
            [ ] username
				link a /codemonkey/<username>
			[ ] nome
			[ ] cognome
            [ ] propic
            [ ] valutazione media
                [ ] component valutazione
            [ ] mailto
            [ ] bio
            [ ] tecnologie
                [ ] list.tecnologie

        [ ] company
            [ ] username
				link a /company/<username>
			[ ] nome
            [ ] propic
            [ ] mailto
            [ ] bio
            [ ] tecnologie
                [ ] list.tecnologie

        [ ] lavoro
            [ ] company
				[ ] username
					link a /company/<username>
                [ ] nome
                [ ] propic
            [ ] codemonkey
				[ ] username
					link a /codemonkey/<username>
                [ ] nome
                [ ] cognome
                [ ] propic
            [ ] titolo
            [ ] descrizione
            [ ] tecnologie
                [ ] list.tecnologie

            se data_inizio != null
                se loggato come company e <username>==<company.username>
                    [ ] termina
                        [ ] dialog lavoro.valutazione
                [ ] data_inizio
                se data_fine != null
                    [ ] data_fine
                    [ ] valutazione
                    [ ] commento
                se data_fine == null
                    [ ] in corso
            se data_inizio == null
                se loggato come codemonkey
                    [ ] accetta
                        [ ] dialog lavoro.conferma
							action=accetta
                    [ ] rifiuta
                        [ ] dialog lavoro.conferma
							action=rifiuta

    [ ] row
        [ ] azione
            [ ] data
            [ ] nome
            [ ] username
                se codemonkey
                    link a /codemonkey/<codemonkey.username>
                se company
                    link a /company/<company.username>
            [ ] descrizione
    
    [ ] dialog
        [ ] registrazione
            [x] qrdata

        [ ] errore
			[ ] registrazione
				[ ] messaggio
			[ ] risposta
				[ ] messaggio
			[ ] permessi
				[ ] messaggio
			[ ] login
				[ ] messaggio

		[ ] lavoro
			[ ] conferma
				[ ] proposta
				[ ] accetta
				[ ] rifiuta
			[ ] valutazione

		[ ] ban
			[ ] conferma
    
    [ ] form
        [ ] registrazione
        [ ] login
        [ ] modifica
            [ ] caricamento_immagine
        [ ] proponi
        [ ] valutazione
        [ ] ban
	
	[ ] select
		[ ] tecnologie
            [ ] lista di checkbox scrollabile verticalmente
        
    [ ] list
        [ ] tecnologie
            [ ] lista scrollabile orizzontalmente
            se in card codemonkey
                [ ] link a /codemonkey/<codemonkey.username>?tecnologia=<tecnologia.id>
            se in card company
                [ ] link a /codemonkey/<codemonkey.username>?tecnologia=<tecnologia.id>

    [ ] chips
        [ ] tecnologie

	[ ] datepicker
		[ ] data inizio-data fine
			[ ] data inizio < data fine < Date.now()
	
	[ ] valutazione
		[ ] n/5
		[ ] 0..5 stelline

viste
    [ ] /regisrazione
        form.registrazione
            [ ] username
            [ ] email
                [ ] controllo email valida
            [ ] password
            [ ] password_confirmation
                [ ] controllo password == password_confirmation
            [ ] company/codemonkey

        [ ] dialog.regisrazione
        [ ] forward a /impostazioni
                    
    [ ] /login
        form.login
            [ ] username
            [ ] password
            [ ] totp
        se codemonkey  
            [ ] vai a /feed?tipo=company
        se company
            [ ] vai a /feed?tipo=codemonkey
        se admin
            [ ] vai a /dashboard

    [ ] /feed || /
		parametri
			[ ] radio button
				?tipo=company
				?tipo=codemonkey
				?tipo=tutto
			[ ] select.tecnologie
				?tecnologie=<tecnologia1,tecnologia2,...>
        [ ] lista card.codemonkey
        [ ] lista card.company


    [ ] /impostazioni
        form.impostazioni
            se codemonkey
                [ ] nome
                [ ] cognome
            se company
                [ ] nome
            [ ] email
                [ ] controllo email valida
            password
                [ ] vecchia password
                [ ] nuova password
                [ ] conferma nuova password
                    [ ] controllo nuova password == conferma nuova password
            [ ] bio
            [ ] propic
            [ ] tecnologie
                [ ] select.tecnologie

    [ ] /dashboard
        [ ] tabella con row.azioni
            [ ] filtri
                [ ] data
                [ ] username
                    se codemonkey
                        [ ] link a /codemonkey/<username>
                    se company
                        [ ] link a /company/<username>
                [ ] titolo
                [ ] descrizione
            
	[ ] /codemonkey/<username>
		se loggato come <username>
            [ ] lista card.l
                [ ] card.lavoro
            [ ] lista lavori.in_corso
                [ ] card.lavoro
		
		se loggato come company
			[ ] /proponi
				parametri
					[ ] titolo
					[ ] descrizione
					[ ] tecnologie
						[ ] selezione da select.tecnologia
					[ ] company = <company.username>
					[ ] codemonkey = <codemonkey.username>
					[ ] data_inizio = null
					[ ] data_fine = null
					[ ] valutazione = null
					[ ] commento = null


		se loggato come admin
			[ ] tasto ban

		[ ] lista card.lavoro
		
		[ ] /lavori
			se loggato come <username>
				[ ] lista card di lavoro con accettato = false
			[ ] /<id_lavoro>
				[ ] card lavoro
			se lavori in corso
				[ ] card lavoro in corso

			[ ] lavori effettuati
			
	[ ] /company/<username>
		se loggato come <username>
			[ ] tasto modifica
			[ ] /modifica
				parametri
					[ ] email
					[ ] password
						[ ] vecchia password
						[ ] nuova password
						[ ] conferma nuova password
					[ ] nome
					[ ] cognome
					[ ] bio
					[ ] propic
						[ ] caricamento immagine
					[ ] tecnologie
			[ ] tasto logout
				[ ] /logout

		[ ] /lavori
			[ ] lavoro in corso
			[ ] lavori effettuati


test
    [ ] controller
        [ ] utente non loggato
        [ ] codemonkey
        [ ] company
        [ ] admin
                
deploy
    [x] development environment
        [x] rails
            [x] live reload
        [x] angular
            [x] nginx reverse proxy
            [x] live reload
        [x] postgres
            [x] docker image

    [ ] release environment
        [ ] rails
            [ ] build
            [ ] run
        [ ] angular
            [x] build
                [ ] ssr
            [x] run
        [x] postgres
            [x] build
            [x] run

    [ ] hosting
        [ ] azure
            [ ] acr
        [ ] vps
