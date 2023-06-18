import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Project } from 'src/app/model/interfaces/project.interface';
import { Technology } from 'src/app/model/interfaces/technology.interface';

import { MatDialog } from '@angular/material/dialog';
import { ProponiPopupComponent } from 'src/app/components/popup/proponi-popup/proponi-popup.component';

import { MatTableModule } from '@angular/material/table';

export interface TagTable {
  name: string;
}


@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss'],
})

export class SettingsComponent implements OnInit {
  displayedColumns: string[] = ['nome', 'operazione'];
  dataSource: any[] = [
    { nome: 'UML', operazione: '' },
    { nome: 'SVELTE', operazione: '' },
    // Aggiungi altre righe con i dati desiderati
  ];
  displayedColumns2: string[] = ['username', 'tipo', 'descrizione', 'data'];
  dataSource2: any[] = [
    { username: 'richardstallman', tipo: 'PROPONICOLLABORAZIONE', descrizione: 'codemonkey=georgeboole;titolo:"Implemen...', data: new Date() },
    { username: 'georgeboole', tipo: 'ACCETTACOLLABORAZIONE', descrizione: 'id=1234567890', data: new Date() },
    // Aggiungi altre righe con i dati desiderati
  ];

  displayedColumns3: string[] = ['username', 'stato'];
  dataSource3: any[] = [
    // Aggiungi altre righe con i dati desiderati
    {username:"georgeboole", stato:"PENDING"},
  ];

  value: string = "";
  technologies: Technology[] = [{ name: "ANGULAR" }, { name: "DOCKER" }];
  project: Project = {
    id: 0,
    rating: 0,
    title: "Implementazione frontend Codedonkey",
    description: "L'attività da svolgere è l'implementazione del frontend dell'applicazione Codedonkey. Deve essere realizzato utilizzando il framework Angular, che deve essere containerizzato utilizzando Docker.",
    technologies: this.technologies,
    codemonkey: "georgeboole",
    company: "richardstallman",
    status: "PENING",
    suggestion_time: new Date(),
    start_time: new Date(),
    end_time: new Date(),
    comment: ""
  }

  constructor(private httpClient: HttpClient, public dialog: MatDialog) { }

  ngOnInit(): void {
    this.fetchWhoAmI();

    // this.dialog.open(ProponiPopupComponent);
  }

  fetchWhoAmI(): void {
    this.httpClient.post('/api/whoami', {}).subscribe(
      (response) => {
        console.log('Response:', response);
      },
      (error) => {
        console.error('Error:', error);
      }
    );
  }

}