todo
    frontend
        [ ] forward a pagina di profilo dopo login
        [ ] card di errore login
        pagina di impostazioni
            [ ] cliente
            [ ] codemonkey
            [ ] admin
            [ ] lavori

    backend
        [ ] check stato utenti in model
        [ ] refactoring di stile

docs
    [x] abstract
    raccolta dei requisiti
    analisi dei requisiti   
        [x] vocabolario
            utente registrato
            progetto
                proposta
                accettazione
                rifiuto
                interruzione
                terminazione
                modifica
            ricerca sinonimo: feed
            valutazioni
            ricerca
            
        [x] scenari
        [x] analisi del rischio
            [x] valutazione dei beni
            [x] minacce e controlli
            [x] tag e vulnerabilità
            [x] diagramma security use case e misuse case
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
        [x] analisi logica
            [x] diagramma dei package
            [x] diagrammi delle classi
                [x] accesso
                [x] amministrazione
                [x] utenti
                [x] homepage
            [x] diagrammi di sequenza
                [x] accesso
                [x] utente
                [x] codemonkey
                [x] cliente
                [x] admin
        [x] piano del collaudo
        [x] piano di lavoro
            [x] divisione dei lavori
            [x] sviluppi fururi
    [x] progettazione
        [x] progettazione architetturale
            [x] requisiti non funzionali
            [x] scelte tecnologiche
            [x] scelta dell'architettura
                [x] frontend
                [x] backend
                [x] database
            [x] diagramma dei package
            [x] diagramma dei componenti
        [x] progettazione di dettaglio
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
        [x] progettazione di dettaglio controllers
            [x] accesso
            [x] utente
            [x] client (frontend)
            [x] server (backend)
            [x] persistenza (database)
        [x] collaudo (test)
        deployment
            [x] containerizzazione
            [x] deploy
           
        
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

model
    user
        codemonkey
        company
        admin
    project
    action 
    technology
    report
            
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
                enum (codemonkey, cliente, admin)

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
            [x] cliente
                foreign key a cliente
            [x] tags
                foreign key a tag
        
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
            gestione?nome=password&<nome>&cognome=<cognome>&bio=<bio>&propic=<propic>&email=<email>&tag=<tag1,tag2,...>
            suggest?tag=<tag>
            report?[codemonkey=<codemonkey.username>||cliente=<codemonkey.username>]
        cliente
            signup
            login
            logout
            new?title=<project.id>&codemonkey=<codemonkey.username>&descrizione=<descrizione>&tag=<tag1,tag2,...>
            terminate?project=<project.id>
            gestione?nome=password&<nome>&bio=<bio>&propic=<propic>&email=<email>&tag=<tag1,tag2,...>
            suggest?tag=<tag>
            report?[codemonkey=<codemonkey.username>||cliente=<codemonkey.username>]
        admin
            login
            logout
            set?[codemonkey=<codemonkey.username>||cliente=<codemonkey.username>]&stato=<attivo|bannato|sospeso>
            add?tag=<tag>
            approve?tag=<tag>
            rifiuta?tag=<tag>

    endpoint
        /api
            endpoint di popolamento dell'interfaccia
                /feed
                    [x] /home
                        si filtra per codemonkey||cliente||tutti
                        si filtra per tag
                        l'ordine è casuale
                        vengono inviate 5 card alla volta
                        bisogna controllare quale card sono state gia visualizzate
                        /home?seen=<username1,username2,...>&technologies=<tag1,tag2,...>&type=<codemonkey|cliente|all>
                    [x] /user
                        si filtra per tag
                        l'ordine è project.suggest_time.asc
                        vengono inviate 5 card alla volta
                        /user?page=<num>&technologies=<tag1,tag2,...>
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
                /project
                    /index
                /report
                    /index
                /technology
                    /index
                /user
                    /index
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
                    [x] /gestione
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
                    [x] tag
                        [x] list.tag

                [x] cliente
                    [x] username
                        link a /cliente/<username>
                    [x] nome
                    [x] propic
                    [x] mailto
                    [x] bio
                    [x] tag
                        [x] list.tag

            [x] project
                [x] cliente
                    [x] link a /cliente/<username>
                    [x] username
                    [x] propic
                [x] codemonkey
                    [x] link a /codemonkey/<username>
                    [x] username
                    [x] propic
                [x] titolo
                [x] descrizione
                [x] tag

                se data_inizio != null
                    se loggato come cliente e <username>==<cliente.username>
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

        [ ] dialog
            [x] signup
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
            
            [ ] segnala
                [ ] motivazione
                [ ] conferma
            
            [ ] proponi collaborazione
                [ ] titolo
                [ ] descrizione
                [ ] tag
                [ ] conferma

        
        [ ] tag
            [ ] lista scrollabile orizzontalmente
            se in card codemonkey
                [ ] link a /codemonkey/<codemonkey.username>?tag=<tag.id>
            se in card cliente
                [ ] link a /codemonkey/<codemonkey.username>?tag=<tag.id>

        [ ] valutazione
            [ ] n/5
            [ ] 0..5 stelline
        
        [ ] tag selector component
            [ ] keyboard search and add
            [ ] collegamento con componente padre
                [ ] binding del dato al parametro nell'url

    pages
        [x] /signup
            [x] username
            [x] email
                [x] controllo email valida
            [x] password
            [x] password_confirmation
                [x] controllo password == password_confirmation
            [x] cliente/codemonkey
            [ ] forward a /gestione
                        
        [ ] /login
            [x] username
            [x] password
            [x] totp
            se codemonkey  
                [ ] vai a /collaborazioni
            se cliente
                [ ] vai a /feed?tipo=codemonkey
            se admin
                [ ] vai a /dashboard

        [ ] /
            parametri
                [x] tag selector
                    ?tag=<tag1,tag2,...>
            [x] lista card codemonkey


        [ ] /gestione
            se utente registrato
                [ ] email
                    [ ] controllo email valida
                password
                    [ ] vecchia password
                    [ ] nuova password
                    [ ] conferma nuova password
                        [ ] controllo nuova password == conferma nuova password
                [ ] bio
                [ ] propic
                [ ] tag
                    [ ] select.tag
            se admin
                [ ] gestione tags
                    [ ] accetta
                    [ ] rifiuta
                [ ] visualizza log
                    [ ] scarica log
                    filtri
                        [ ] tipo
                        [ ] username
                        [ ] data
                [ ] gestione utenti
                

        [ ] /codemonkey/<username>
            se loggato come <username>
                [ ] lista card.l
                    [ ] card.lavoro
                [ ] lista lavori.in_corso
                    [ ] card.lavoro
            
            se loggato come cliente
                [ ] /proponi
                    parametri
                        [ ] titolo
                        [ ] descrizione
                        [ ] tag
                            [ ] selezione da select.tag
                        [ ] cliente = <cliente.username>
                        [ ] codemonkey = <codemonkey.username>
                        [ ] data_inizio = Date.now()
                        [ ] data_fine = null
                        [ ] valutazione = null
                        [ ] commento = null

            [ ] lista card.lavoro
                
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
