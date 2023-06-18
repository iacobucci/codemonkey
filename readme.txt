TODO
    review di lucidchart
    casi d'uso
    security use case e misuse case
    collaudo
        unit test
    screenshot 
        [x] login
        [x] registrazione
        [x] home
        [x] profilo
        [ ] modifica profilo
        [ ] proposta tag

        [x] report utente
        [x] proposta collaborazione

        [x] lista collaborazioni
        [x] accetta o rifiuta collaborazione
        [ ] interrompi collaborazione
        [ ] termina collaborazione

        admin
            [ ] gestione tag
            [ ] visualizza log
            [ ] gestione utenti

docs
    [x] abstract
    [x] analisi dei requisiti   
        [x] raccolta dei requisiti
        [x] vocabolario
        [x] requisiti
            [x] funzionali
            [x] non funzionali
            [x] dominio
            [ ] diagramma casi d'uso
                [ ] img
        [x] scenari
        [x] analisi del rischio
            [x] valutazione dei beni
            [x] minacce e controlli
            [x] tecnologia e vulnerabilità
            [x] diagramma security use case e misuse case
                [ ] img
            [x] security use case e misuse case
        [x] aggiornamento requisiti
            [x] funzionali
            [x] non funzionali
            [x] vocabolario
            [x] casi d'uso
    [x] analisi del problema
        [x] analisi funzionalità
            [x] tabelle funzionalità
            [x] tabelle informazioni di flusso
            [x] analisi vincoli
            [x] analisi interazioni
        [x] analisi ruoli
            [x] analisi ruoli e responsabilità
            [x] tabelle ruolo e informazioni
        [x] scomposizione del probelma
            [x] tabella scomposizione funzionalita
        [x] modello di dominio
            [x] Accesso
                User
                Registrazione
                Login
                Tipo
                Username
                    username
                Email
                    email
                Password
                    passwordDigest
                RegistredUser
                    username
                    email
                    password
                Cliente
                Codemonkey
                Admin
            [x] Account
                RegistredUser
                    username
                    email
                    password
                    biografia
                    immagineProfilo
                Codemonkey
                    setTags(Tag[])
                Cliente
                Biografia
                    biografia
                Tag
                    nome
                ImmagineDiProfilo
                    immagine
                progettazione
                    ActionAccount
                        setPassword
                        setBiografia
                        setImmagineProfilo
                        setTags
                        setEmail
            [x] Collaborazione
                Collaborazione
                    id
                    titolo
                    stato
                    descrizione
                    tags
                    valutazione
                    codemonkey
                    client
                    dataProposta
                    dataAccettazione
                    dataTerminazione
                Titolo
                    titolo
                Descrizione
                    descrizione
                Tag
                    nome
                Valutazione
                    rating
                    commento
                StatoProgetto
                    PROPOSTA
                    ACCETTATA
                    RIFIUTATA
                    INTERROTTA
                    TERMINATA
                Client
                    proponiCollaborazione(Codemonkey, Titolo, Descrizione, Tags)
                    modificaCollaborazione(Collaborazione, Titolo, Descrizione, Tags)
                    accettaCollaborazione(Collaborazione)
                Codemonkey
                    accettaCollaborazione(Collaborazione)
                    rifiutaCollaborazione(Collaborazione)
                    interrompiCollaborazione(Collaborazione)
                progettazione
                    ActionCollaborazione
                        proponiCollaborazione
                        modificaCollaborazione
                        accettaCollaborazione
                        rifiutaCollaborazione
                        interrompiCollaborazione
                        terminaCollaborazione
            [x] Tag
                Tag
                    nome
                    stato
                    dataProposta
                StatoTag
                    APPROVATO
                    RIFIUTATO
                    IN_ATTESA
                Admin
                    approvaTag(Tag)
                    rifiutaTag(Tag)
                Codemonkey
                    proponiTag(String)
                progettazione
                    ActionTag
                        proponiTag
                        approvaTag
                        rifiutaTag
            [x] Segnalazioni
                Admin
                    setStatoUser(User, StatoUser)
                StatoUser
                    IN_ATTESA
                    ATTIVO
                    LIMITATO
                    BLOCCATO
                RegistredUser
                    stato
                    reportUser(User, Motivazione)
                Report
                    mittente
                    destinatario
                    motivazione
                    data
                Motivazione
                    motivazione
                progettazione
                    ActionReport
                        setUserStatus
                        reportUser
            [x] Log
                Log
                    user
                    time
                    tipo
                    description
                TipoLog
                    REGISTRAZIONE
                    LOGIN
                    CANCELLA
                    SETPASSWORD
                    SETBIOGRAFIA
                    SETIMMAGINEPROFILO
                    SETTAGS
                    SETEMAIL
                    PROPONICOLLABORAZIONE
                    MODIFICACOLLABORAZIONE
                    ACCETTACOLLABORAZIONE
                    RIFIUTACOLLABORAZIONE
                    INTERROMPICOLLABORAZIONE
                    TERMINACOLLABORAZIONE
                    PROPONITAG
                    APPROVATAG
                    RIFIUTATAG
                    SETUSERSTATUS
                    REPORTUSER
                LogDescription
                    description
                RegistredUser
                Admin
                    downloadLog()
                    visualizzaLog()
        [ ] analisi logica
            [ ] diagramma dei package
                [ ] svg
            [ ] diagrammi delle classi
                [ ] accesso
                    [ ] svg
                [ ] amministrazione
                    [ ] svg
                [ ] utenti
                    [ ]
            [ ] diagrammi di sequenza
                [ ] accesso
                    [ ] svg
                [ ] utente
                    [ ] svg
                [ ] codemonkey
                    [ ] svg
                [ ] cliente
                    [ ] svg
                [ ] admin
                    [ ] svg
        [x] piano del collaudo
        [x] piano di lavoro
            [x] divisione dei lavori
            [x] sviluppi fururi
    [ ] progettazione
        [x] progettazione architetturale
            [x] requisiti non funzionali
            [x] scelte tecnologiche
            [x] scelta dell'architettura
                [x] frontend
                [x] backend
                [x] database
        [ ] progettazione di dettaglio
            [x] dominio
                gestione accesso
                    [x] Totp
                        [x] value: String
                    [x] Qrcode
                        [x] data: String
                gestione dei log
                    LogAccesso extends Log
                        registrazione(RegistredUser, DescrizioneLog)
                        login(RegistredUser, DescrizioneLog)
                        cancella(RegistredUser, DescrizioneLog)
                    LogAccount extends Log
                        setPassword(RegistredUser, DescrizioneLog)
                        setBiografia(RegistredUser, DescrizioneLog)
                        setImmagineProfilo(RegistredUser, DescrizioneLog)
                        setTags(RegistredUser, DescrizioneLog)
                        setEmail(RegistredUser, DescrizioneLog)
                    LogCollaborazione extends Log
                        proponiCollaborazione(RegistredUser, DescrizioneLog)
                        modificaCollaborazione(RegistredUser, DescrizioneLog)
                        accettaCollaborazione(RegistredUser, DescrizioneLog)
                        rifiutaCollaborazione(RegistredUser, DescrizioneLog)
                        interrompiCollaborazione(RegistredUser, DescrizioneLog)
                        terminaCollaborazione(RegistredUser, DescrizioneLog)
                    LogTag extends Log
                        proponiTag(RegistredUser, DescrizioneLog)
                        approvaTag(RegistredUser, DescrizioneLog)
                        rifiutaTag(RegistredUser, DescrizioneLog)
                    LogReport extends Log
                        setUserStatus(RegistredUser, DescrizioneLog)
                        reportUser(RegistredUser, DescrizioneLog)
            [x] interfacce
                [x] ILog
                [x] ILogAccesso
                [x] ILogAccount
                [x] ILogCollaborazione
                [x] ILogSegnalazione
                [x] ILogTag
                [x] IAutenticazione
                [x] IRegistrazione
                [x] IAmministratore
                [x] IUtente
                [x] ICliente
                [x] ICodemonkey
                [x] ICollaborazione
                [ ] svg
        [ ] progettazione di dettaglio controllers
            [ ] accesso
                [ ] svg
            [ ] utente
                [ ] svg
            [ ] codemonkey
                [ ] svg
            [ ] cliente
                [ ] svg
            [ ] amministratore
                [ ] svg
        [ ] progettazione di dettaglio views
            [ ] accesso
                [ ] svg
            [ ] utente
                [ ] svg
            [ ] codemonkey
                [ ] svg
            [ ] cliente
                [ ] svg
            [ ] amministratore
                [ ] svg
        [ ] progettazione di dettaglio interazioni
            [ ] accesso
                [ ] svg
            [ ] utente
                [ ] svg
            [ ] codemonkey
                [ ] svg
            [ ] cliente
                [ ] svg
            [ ] amministratore
                [ ] svg
        [ ] progettazione persistenza
            [ ] diagramma er
                [ ] svg
            [x] formato files di logs
        [x] progettazione collaudo
            [x] unit test
                [x] backend
                [x] frontend
            [x] test curl
        [ ] deployment
            [ ] artefatti
                [ ] svg
            [ ] diagramma di deployment
                [ ] svg
            
backend
    migrations
        [x] users
            [x] username
                primary key varchar(255)
            [x] password_digest
                varchar(255)
            [x] totp_secret
                varchar(255)
            [x] email
                varchar(255)
            [x] type
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
                varchar(256)
            [x] description
                varchar(4096)

            [x] status
                string

            [x] suggest_time
                datetime
            [x] start_time
                date
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

    endpoint
        /api
            endpoint di popolamento dell'interfaccia
                /feed
                    [x] /home
                        si filtra per codemonkey||company||tutti
                        si filtra per tecnologia
                        l'ordine è casuale
                        vengono inviate 5 card alla volta
                        bisogna controllare quale card sono state gia visualizzate
                        /home?seen=<username1,username2,...>&technologies=<tecnologia1,tecnologia2,...>&type=<codemonkey|company|all>
                    [x] /user
                        si filtra per tecnologia
                        l'ordine è project.suggest_time.asc
                        vengono inviate 5 card alla volta
                        /user?page=<num>&technologies=<tecnologia1,tecnologia2,...>
                    [x] technologies
                /dashboard
                    [x] actions
                        lista di tutte le actions
                        l'ordine è actions.time.desc
                        vengono inviate 20 card alla volta
                        /dashboard?page=<num>
                        ovviamente si possono perdere di vista le actions per via della paginazione
                    [x] technologies
                    [x] download
            endpoint di controllo
                /project
                    [x] /accept
                    [x] /reject
                    [x] /new
                    [x] /terminate
                    [x] /edit
                /report
                    [x] /send
                    [x] /ban
                /technology
                    [x] /suggest
                    [x] /approve
                    [x] /reject
                /user
                    [x] /signup
                    [x] /login
                    [x] /delete
                    [x] /logout
                    [x] /settings
                    [x] /rating_by_technologies
                        /propic
                        [x] /upload
                        [x] /delete
                        [x] /download

frontend
    components
        [ ] card
            [x] user
                [x] codemonkey
                    [x] username
                        link a /codemonkey/<username>
                    [x] nome
                    [x] cognome
                    [x] propic
                    [x] valutazione media
                        [x] component valutazione
                    [x] mailto
                    [x] bio
                    [x] tecnologie
                        [x] list.tecnologie

                [x] company
                    [x] username
                        link a /company/<username>
                    [x] nome
                    [x] propic
                    [x] mailto
                    [x] bio
                    [x] tecnologie
                        [x] list.tecnologie

            [x] project
                [x] company
                    [x] link a /company/<username>
                    [x] username
                    [x] nome
                    [x] propic
                [ ] codemonkey
                    [x] link a /codemonkey/<username>
                    [x] username
                    [x] nome
                    [x] cognome
                    [x] propic
                [x] titolo
                [x] descrizione
                [x] tecnologie
                    [x] list.tecnologie

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
            [x] signup
                [x] username
                [x] email
                    [x] controllo email valida
                [x] password
                [x] password_confirmation
                    [x] controllo password == password_confirmation
                [x] company/codemonkey

            [x] login
                [x] username
                [x] password
                [x] totp

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

        
        [ ] valutazione
            [ ] n/5
            [ ] 0..5 stelline

    pages
        [ ] /signup
            form.signup
            [ ] forward a /impostazioni
                        
        [ ] /login
            form.login
            se codemonkey  
                [ ] vai a /feed?tipo=company
            se company
                [ ] vai a /feed?tipo=codemonkey
            se admin
                [ ] vai a /dashboard

        [ ] /
            parametri
                [x] select.tecnologie
                    ?tecnologie=<tecnologia1,tecnologia2,...>
            [x] lista card codemonkey


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

deployment
    [x] development environment
        [x] rails
            [x] live reload
        [x] angular
            [x] nginx reverse proxy
            [x] live reload
        [x] postgres
            [x] docker image

    [x] release environment
        [x] rails
            [x] build
            [x] run
        [x] angular
            [x] build
            [x] run
        [x] postgres
            [x] build
            [x] run

    [ ] hosting
        [ ] azure
        [x] vps
            container registry
                [x] docker hub
                [ ] privato

debug
    JWT
        admin1
            eyJhbGciOiJIUzI2NiJ9.eyJleHAiOjE2ODQ4NTcxNzEsInVzZXJfaWQiOiJhZG1pbjEifQ.OPttxCJHCuXykeSaCPQLMLYCtFC89LrczmjtfNiXHhY

        google
            eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODQ4ODc4NzgsInVzZXJfaWQiOiJnb29nbGUifQ.G6bI3AEuJa2j4fnINaxkdYUgX9jf85Oj9u4xI8ALh9M

        mario
            eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODQ4NTc2NDcsInVzZXJfaWQiOiJtYXJpbyJ9.mPayYPyy45Sz26vkvjus2gupb9ZrG0KdJrsSaYdctJk

    users
        [x] Charles Babbage
        [x] Geoge Boole
        [x] Alan Turing
        [x] Claude Shannon
        [x] John Von Neumann
        [x] Marvin Minsky
        [ ] Norbert Weiner
        [ ] Ray Solomonoff
        [ ] John McCarthy
        [ ] Dennis Ritchie
        [ ] Edsger Dijkstra
        [ ] Richard Hamming
        [ ] Warren McCullock
        [ ] Walter Pitts
        [ ] Herbert Simon
        [ ] Allen Newell
        [ ] Joseph Weizenbaum
        [ ] Seymour Papert
        [ ] Vannevar Bush
        [ ] Corrado Bohm
        [ ] Valentino Braitenberg
        [ ] Donald Knuth
        [ ] Brian Kernighan
        [ ] Dennis Ritchie
        [ ] Richard Stallman
        [ ] Bill Gates
        [ ] Steve Jobs
        [ ] Steve Wozniak
        [ ] George Hotz
        
        [ ] Ada Lovelace
        [ ] Rózsa Péter
        [ ] Grace hopper
        [ ] Barbara Liskov
        [ ] Margaret Hamilton
        [ ] Katherine Johnson