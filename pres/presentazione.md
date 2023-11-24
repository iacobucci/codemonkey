---
marp: true
paginate: true
---

<!-- paginate: false -->

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

I clienti possono sfogliare i profili delle codemonkeys e proporre loro una **collaborazione**, che la codemonkey può accettare o rifiutare.

A lavoro concluso, il cliente può valutare la collaborazione ed il profilo della codemonkey è aggiornato con la nuova **valutazione**.

<!-- Codemonkey é un’applicazione di matching che ha l’obiettivo di mettere in comunicazione dei programmatori di base con aziende che ne hanno bisogno
Le aziende identificate come Clienti avranno la possibilità di osservare tutte le Codemonkey iscritte alla piattaforma e potranno presentare delle proposte di lavoro note come Collaborazioni
I programmatori identificati come Codemonkey metteranno a disposizione delle aziende una certa tipologia di servizi -->

<!-- Ogni persona potrà consultare il sito web e visionare la lista di Codemonkey disponibili
Un qualsiasi Cliente\Utente potrà proporre lavoro ad una Codemonkey (l’Utente dovrà poi o Autenticarsi o Registrarsi al sistema come Cliente)
Una Codemonkey avrà la possibilità di registrarsi alla piattaforma e rendersi visibile -->

---

# Gestione dei profili e delle collaborazioni

Codemonkey|Cliente
----------|-------
Modifica di email, password, descrizione|Modifica di email, password
Visualizzazione e gestione delle collaborazioni con possibilità di accettare, rifiutare, segnalare e interrompere collaborazioni|Visualizzazione e gestione delle collaborazioni con possibilità di terminare e valutare la Codemonkey
Selezione dei tag|

---

# Implementazione

### Frontend
**Angular** è un framework orientato a componenti basato su *typescript*.
### Backend
**Rails** è un framework per app web con pattern MVC basato su *Ruby*.
### Database
**PostgreSQL** è un DBMS relazionale.
#### Reverse proxy
**Nginx** è un web server HTTP e reverse proxy.

---

# Deployment

Containerizzazione dell’applicazione tramite Docker, rilascio su Microsoft Azure.

Pro|Contro
---|------
Virtualizzazione (isolamento)|Sicurezza condivisa
Disponibilità|Costo maggiorato

Viene predisposto l'utilizzo di **object server** per il caricamento/scaricamento delle immagini di profilo, di **database server** per la gestione di entità e relazioni e **log server** per il salvataggio sequenziale di eventi, oltre a **servizi per container** per l'orchestrazione.
