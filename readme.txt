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
        [x] signup
            [x] matching passwords
            [x] qr code
                [x] bug libreria
	    [ ] capire come ottenere parametri da componente genitore
            premendo sul componente technologies dalla card user si viene reindirizzati a /<username>?technologies=<tecnologies>
        [ ] ssr
            caricamento pagina più veloce
        [ ] pwa
            salvataggio in cache delle immagini

    backend
        [x] database connection
        [x] ActiveRecord
        [x] 2FA totp
        [x] JWT
        [x] activerecord
            model.property = new_property
            model.save

    database
        [x] modellare tabelle con rails db:migration
        [x] sti
            grande tablela user con type
        [x] salvataggio propic come jpeg
            
        
db
    [x] users
        [x] username
            primary key varchar(255)
        [x] password_digest
            varchar(255)
        [x] totp_secret
            varchar(255)
        [x] email
            varchar(255)
        [x] tipo
            enum (codemonkey, company, admin)

    [x] codemonkeys extends user
        [x] first_name
            varchar(255)
        [x] bio
            varchar(4095)
        [x] propic
            blob
        [x] status
            enum (active, banned)
        [x] last_name
            varchar(255)
        [x] rating
            int null
                
    [x] companies extends user
        [x] name
            varchar(255)
        [x] bio
            varchar(4095)
        [x] propic
            blob
        [x] status
            enum (active, banned)

    [x] admin extends user

    [x] technologies
        [x] id
            primary key int autoincrement
        [x] name
            varchar(255)
        [x] suggest_time
            datetime
        [x] approved
            boolean
        [x] rejected
            boolean

    [x] projects
        [x] id
            primary key int autoincrement
        [x] title
            varchar(255)
        [x] description
            varchar(4095)

        [x] suggest_time
            datetime

        [x] start_time
            date
        [x] rejected
            boolean

        [x] end_time
            date
        [x] rating
            int null
        [x] comment
            varchar(1024)
            
        [x] codemonkey
            foreign key a codemonkey
        [x] company
            foreign key a company
        [x] tecnologies
            foreign key a tecnologie
    
    [x] technologies_projects
        [x] project
            foreign key a project
        [x] technology
            foreign key a technology
    
    [x] projects_users
        [x] user
            foreign key a user
        [x] technology
            foreign key a technology
    
    [x] technologies_users
        [x] user
            foreign key a user
        [x] technology
            foreign key a technology

    [x] reports
        [x] id 
            primary key int autoincrement
        [x] from
            foreign key a user
        [x] to
            foreign key a user
        [x] data
            datetime
        [x] descrizione
            varchar(1024)

    [x] actions 1:N
        [x] id
            primary key int autoincrement
        [x] name
            varchar(255)
        [x] user
            foreign key a user
        [x] time
            datetime
        [x] description
            varchar(8191)

actions
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
    /api
        endpoint di popolamento dell'interfaccia
            /feed
                [ ] /dashboard
                    lista di tutte le actions
                    l'ordine è actions.time.desc
                    vengono inviate 20 card alla volta
                    /dashboard?page=<num>
                    ovviamente si possono perdere di vista le actions per via della paginazione
                [ ] /home
                    si filtra per codemonkey||company||tutti
                    si filtra per tecnologia
                    l'ordine è casuale
                    vengono inviate 5 card alla volta

                    bisogna controllare quale card sono state gia visualizzate
                    /home?seen=<username1,username2,...>&technologies=<tecnologia1,tecnologia2,...>&type=<codemonkey|company|all>
                [ ] /user
                    si filtra per tecnologia
                    l'ordine è project.suggest_time.asc
                    vengono inviate 5 card alla volta
                    /user?page=<num>&technologies=<tecnologia1,tecnologia2,...>
        endpoint di controllo
            /project
                [ ] /accept
                [ ] /reject
                [ ] /new
                [ ] /terminate
                [ ] /edit
            /report
                [ ] /send
                [ ] /ban
            /technology
                [ ] /suggest
                [ ] /approve
                [ ] /reject
            /user
                [x] /signup
                [x] /login
                [x] /delete
                [x] /logout
                [x] /settings
                    /propic
                    [x] /upload
                    [x] /delete
                    [x] /download

components
    [ ] card
        [ ] user
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

        [ ] project
            [ ] company
				[ ] link a /company/<username>
				[ ] username
                [ ] nome
                [ ] propic
            [ ] codemonkey
                [ ] link a /codemonkey/<username>
				[ ] username
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
        [ ] signup
            [x] qrdata

        [ ] errore
			[ ] signup
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
        [ ] signup
        [ ] login
        [ ] settings
            [ ] upload
        [ ] suggest
        [ ] rate
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

pages
    [ ] /signup
        form.signup
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


    [ ] /settings
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
