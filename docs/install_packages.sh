#!/bin/bash

# Aggiorna l'elenco dei pacchetti TeX Live e installa gli aggiornamenti disponibili
tlmgr update --self

# Installa pacchetti aggiuntivi necessari per il tuo progetto (sostituisci con i nomi dei pacchetti corretti)
tlmgr install \
  blindtext  \
  geometry \
  adjustbox \
  changepage \
  multirow \
  tocloft \
  graphics \
  tabu \
  wrapfig \
  xltabular \
  xcolor \
