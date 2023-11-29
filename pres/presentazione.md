---
marp: true
---

<script src="node_modules/mermaid/dist/mermaid.min.js"></script>

<script>mermaid.initialize({startOnLoad:true, theme:"neutral", mirrorActors:false});</script>
<link rel="stylesheet" href="res/styles.css">

# Codemonkey

![bg right](res/icon.png)

**Gruppo 11**
- Alessandro Ricci A.
0000978068
- Stefano Allevi
0000990314
- Valerio Iacobucci
0000976541
---

![bg left:33%](res/homepage.png)

Codemonkey è un'applicazione che espone programmatori (**Codemonkeys**) a realtà lavorative che ne hanno bisogno (**Clienti**).

I clienti possono sfogliare i profili delle codemonkeys in base a **tag** e proporre loro una **collaborazione**, che la codemonkey può accettare o rifiutare.

A lavoro concluso, il cliente può valutare la collaborazione ed il profilo della codemonkey è aggiornato con la nuova **valutazione**.

---
<div class="container">
<div class="content" style="height:100%">

## Codemonkey
- Modifica di dati personali (email, password, bio)
- Gestione dei tag personali
    - Aggiunta
    - Rimozione
    - Proposta
- Gestione delle collaborazioni
    - Accettazione
    - Rifiuto
    - Interruzione
    - Segnalazione
</div>

<div class="content" style="height:100%">

## Cliente
- Modifica di dati personali (email, password)
- Ricerca di Codemonkey attraverso feed
    - Può filtrare per tag e vedere valutazioni passate
- Gestione delle collaborazioni
    - Proposta
    - Interruzione 
    - Terminazione e valutazione
    - Segnalazione
</div>
</div>                                               

---

![bg right:33%](res/dashboard.png)
# Amministrazione del sistema

Sono previsti degli amministratori, che avranno accesso ad una **dashboard** dove:
- Accettare o rifiutare tags
- Visionare il file di log
- Gestire gli utenti assegnando uno stato:
    - *in attesa*
    - attivo
    - limitato (Cliente)
    - sospeso
    - bloccato

---

<!-- ![bg fit right:33%](res/componenti.jpeg) -->

<div class="container">
<div class="content">

# Implementazione

I server dedicati alla registrazione, all'accesso, alle operazioni utente ed alla gestione delle collaborazioni sono realizzati con servizi di **Frontend** e **Backend**.

**Nginx** è un web server HTTP e reverse proxy. Fa da broker: instrada le richieste del client al server corretto.

Un semplice applicativo in un server *Linux* fa da **Server Log**.

**PostgreSQL** è il DBMS relazionale scelto.

</div>

<div class="content">

[![](https://mermaid.ink/img/pako:eNqNk8tunDAUhl8FOVuSuZDABFWRuEaRmtVkERW6MPYBrIBNjUk1GvHutYFkJlIVDWz8n_87F6PDERFBAfmobMRfUmOprJc455Z-XrOoYcDV71kGWSjFG8hFvlrX1w9WMIt-KCqJu9rqQb6D7OdomKVScAWcLjlRFmLydtL6tNS2fphq4RcVfVFJtp9qWz9FtaQvzaZB0iwOn_f_MR6zcNA91RJciGTynrKzYurQgL5VyZrGv0rjOAk8u1fmyv4V9YpiR87BcAGjifwEg7vQidbnYHQpmHwP6lfNYPAxo5vu0hMYr2MvTk5Yehn2eBn29B2GbNSCbDGjepGO5lI5UjW0kCNfHzkMSuImR_Zs9fBnAE4gErxklWGO84fIUcukFDIgSugl0kaJmx6MOeZ81G3woMT-wAnylRzARkNHsYKYYb1-LfIn3EYd5r-EOGmgTBd8nhd92vePzGRyPsFGYApaHpE6dAauWK80TKZJTXyQjQ7XSnW9v1oZ-6Ziqh6KGyLaVc-o-YXq93t35W7dHd464HoOvnMcSorN_a7c3m5K6q03W4zGcfwH1tEX-Q?type=png)](https://mermaid.live/edit#pako:eNqNk8tunDAUhl8FOVuSuZDABFWRuEaRmtVkERW6MPYBrIBNjUk1GvHutYFkJlIVDWz8n_87F6PDERFBAfmobMRfUmOprJc455Z-XrOoYcDV71kGWSjFG8hFvlrX1w9WMIt-KCqJu9rqQb6D7OdomKVScAWcLjlRFmLydtL6tNS2fphq4RcVfVFJtp9qWz9FtaQvzaZB0iwOn_f_MR6zcNA91RJciGTynrKzYurQgL5VyZrGv0rjOAk8u1fmyv4V9YpiR87BcAGjifwEg7vQidbnYHQpmHwP6lfNYPAxo5vu0hMYr2MvTk5Yehn2eBn29B2GbNSCbDGjepGO5lI5UjW0kCNfHzkMSuImR_Zs9fBnAE4gErxklWGO84fIUcukFDIgSugl0kaJmx6MOeZ81G3woMT-wAnylRzARkNHsYKYYb1-LfIn3EYd5r-EOGmgTBd8nhd92vePzGRyPsFGYApaHpE6dAauWK80TKZJTXyQjQ7XSnW9v1oZ-6Ziqh6KGyLaVc-o-YXq93t35W7dHd464HoOvnMcSorN_a7c3m5K6q03W4zGcfwH1tEX-Q)
</div>
</div>

---
<!-- ![bg fit right:33%](res/rails.png) -->

<div class="container">
<div class="content">

# Backend
**Rails**, routes /api
In fase di implementazione è stato utilizzata una variazione sul pattern **MVC**, perchè la view è stata implementata con *Angular*.
- **Model**: gestisce i dati e le relazioni
- **Controller**: gestisce le richieste e le risposte

È stato utilizzato l'**ORM** *ActiveRecord* per la gestione delle entità e delle relazioni.
</div>
<div class="content">

```shell
backend
├─ app
│  ├─ controllers
│  │  ├─ collaborazione
│  │  │  ├─ accetta_controller.rb
│  │  │  ├─ modifica_controller.rb
│  │  │  ├─ proponi_controller.rb
│  │  │  ...
│  │  ...
│  └─ models
│     ├─ cliente.rb
│     ├─ codemonkey.rb
│     ├─ collaborazione.rb
│     ...
├─ config
│  ├─ database.yml
│  ├─ environments
│  │  ├─ development.rb
│  │  ├─ production.rb
│  └─ routes.rb
├─ db
│  └─ migrate # dall'e-r 
│     ├─ clienti.rb
│     ├─ codemonkeys.rb
│     ├─ collaborazioni.rb
│     ...
├─ Dockerfile
├─ lib
│  └─ json_web_token.rb
└─ test
   ├─ controllers
   │  ├─ collaborazione
   │  │  ├─ accetta_controller_test.rb
   │  │  ...
   └─ models
      ├─ codemonkey.rb
      ...
```

</div>
</div>

---

<!-- ![bg fit right:33%](res/angular.png) -->

<div class="container">
<div class="content">

# Frontend
**Angular**, routes /
Framework per la creazione di applicazioni orientate a **componenti**
- basato su *typescript*
- permette di creare *single page applications*
- può essere utilizzato per creare applicazioni web, desktop e mobile
</div>

<div class="content">

```shell
frontend
├─ angular.json
├─ Dockerfile
├─ package.json
└─ src
   ├─ token.interceptor.ts
   └─ app
      ├─ app.component.html
      ├─ app.component.ts
      ├─ components
      │  ├─ card
      │  |  ├─ collaborazione-card
      │  |  │  ├─ collaborazione-card.component.html
      │  |  │  └─ collaborazione-card.component.ts
      │  |  └─ user-card
      │  |     ├─ cliente
      │  |     │  └── cliente-card.component.ts
      │  |     ├─ codemonkey
      │  |     │  └── codemonkey-card.component.ts
      │  |     ├─ user-card.component.html
      │  |     └─ user-card.component.ts
      |  ...
      ├─ model
      │  └─ interfaces
      │     ├─ cliente.interface.ts
      │     ├─ codemonkey.interface.ts
      │     ├─ collaborazione.interface.ts
      │     ...
      └─ pages
         ├─ home
         │  ├─ home.component.html
         │  └─ home.component.ts
         ├─ login
         |  ├─ login.component.html
         |  └─ login.component.ts
         ...
```
</div>
</div>

---


![bg right:33%](res/git.png)

# Sviluppo
Gli sviluppatori lavorano in **feature branch** separati e **merge request** nella repository **git** del progetto.

Nella codebase è disponibile una **modalità di sviluppo** per testare cambiamenti in `localhost`, che vengono subito riflessi nel browser, al salvataggio del file sorgente.

Quando i cambiamenti sono pronti in `dev-X` viene effettuato un merge nel branch `master` e si procede con lo **staging**.

---

# Deployment

Per il rilascio i sorgenti vengono trasferiti in un ambiente **Docker** e compilati. Si crea un'*immagine* da caricare su un servizio di **cloud computing**.

<div class="container">
<div class="content">

| Pro                           | Contro              |
| ----------------------------- | ------------------- |
| Virtualizzazione (isolamento) | Sicurezza condivisa |
| Disponibilità                 | Costo maggiorato    |

</div>
</div>

Viene predisposto l'utilizzo di **object server** per il caricamento/scaricamento delle immagini di profilo, di **database server** per la gestione di entità e relazioni e **log server** per il salvataggio sequenziale di eventi, oltre a **servizi per container** per l'orchestrazione.

---

# Sicurezza

**HTTPS** per la comunicazione tra client e server.
> Le richieste e le risposte sono cifrate con TLS.

**TOTP** per l'autenticazione a due fattori.
> Alla registrazione viene generato un codice QR che l'utente può scansionare con un'applicazione che genera codici di verifica usa e getta.

**JWT** per l'autenticazione.
> Il client (browser web) salva il token in localStorage e lo invia al server in ogni richiesta.

**Hashing** e **Salting** per la memorizzazione delle password.
> Le password non vengono mai salvate in chiaro.

---

<div style="height=80%">
<div>
<div class="container">
<div class="content">
    <img src="res/profilo_codemonkey.png" height="30%"/>
</div>
<div class="content">
    <img src="res/gestione_account.png" height="30%"/>
</div>
<div class="content">
    <img src="res/lista_collaborazioni.png" height="30%"/>
</div>
</div>
</div>
<div>
<div class="container">
<div class="content">
    <img src="res/qrcode.png" height="30%"/>
</div>
<div class="content">
    <img src="res/tags.png" height="30%"/>
</div>
<div class="content">
    <img src="res/proponi_collaborazione.png" height="30%"/>
</div>
</div>
</div>
</div>