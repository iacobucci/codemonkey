import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Project } from 'src/app/model/interfaces/project.interface';
import { Technology } from 'src/app/model/interfaces/technology.interface';

import { MatDialog } from '@angular/material/dialog';
import { ProponiPopupComponent } from 'src/app/components/popup/proponi-popup/proponi-popup.component';


@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.scss']
})
export class SettingsComponent implements OnInit {

  value: string = "";
  technologies: Technology[] = [{name: "ANGULAR"}, {name: "DOCKER"}];
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
    
    this.dialog.open(ProponiPopupComponent);
  }
    
  fetchWhoAmI(): void {
    this.httpClient.post('/api/whoami',{}).subscribe(
      (response) => {
        console.log('Response:', response);
      },
      (error) => {
        console.error('Error:', error);
      }
    );
  }
  
}