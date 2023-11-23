---
marp: true
---

# Codemonkey
Gruppo 11
Alessandro Ricci A.
0000978068
Stefano Allevi
0000990314
Valerio Iacobucci
0000976541

<style> 

.top {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
.columns {
	text-align: center;
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
    justify-content: center !important;
}

</style>

---


Codemonkey é un’applicazione di matching che ha l’obiettivo di mettere in comunicazione dei programmatori di base con aziende che ne hanno bisogno

Le aziende identificate come Clienti avranno la possibilità di osservare tutte le Codemonkey iscritte alla piattaforma e potranno presentare delle proposte di lavoro note come Collaborazioni

I programmatori identificati come Codemonkey metteranno a disposizione delle aziende una certa tipologia di servizi

---

Ogni persona potrà consultare il sito web e visionare la lista di Codemonkey disponibili
Un qualsiasi Cliente\Utente potrà proporre lavoro ad una Codemonkey (l’Utente dovrà poi o Autenticarsi o Registrarsi al sistema come Cliente)
Una Codemonkey avrà la possibilità di registrarsi alla piattaforma e rendersi visibile

---

Ogni persona potrà consultare il sito web e visionare la lista di Codemonkey disponibili
Un qualsiasi Cliente\Utente potrà proporre lavoro ad una Codemonkey (l’Utente dovrà poi o Autenticarsi o Registrarsi al sistema come Cliente)
Una Codemonkey avrà la possibilità di registrarsi alla piattaforma e rendersi visibile

---


<div class="top"> Per la gestione dei vari profili da parte dei vari Registrati al sistema sono state create 2 aree personalizzate, una dedicata alla Codemonkey, l’altra al Cliente contenenti varie sezioni che implementano diverse funzionalità </div>

<div class="columns">
<div>

## Codemonkey
- Modifica account
- Visualizzazione e gestione delle collaborazioni con possibilità di accettare, rifiutare, segnalare e interrompere collaborazioni
- Gestione dei Tag

</div>

<div>

## Cliente
- Modifica account
- Visualizzazione e gestione delle collaborazioni con possibilità di terminare e valutare la Codemonkey

</div>
</div>

---

# Implementazione

## Frontend
**Angular** utilizza *typescript* per la tipizzazione statica.
## Backend
**Ruby on Rails** è un framework per app web il pattern architetturale MVC.
## Database
**PostgreSQL** è un DBMS ad oggetti rilasciato con licenza libera.
## Reverse proxy
**Nginx** è un web server HTTP e reverse proxy open source.

---

# Deployment

Containerizzazione dell’applicazione tramite Docker

<div class="columns">

<div>

## Pro

- Virutalizzazione (isolamento)

</div>


<div>

## Contro
- Sicurezza condivisa

</div>
<div>