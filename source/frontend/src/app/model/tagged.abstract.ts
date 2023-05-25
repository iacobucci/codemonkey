import { Technology } from './interfaces/technology.interface';
import { HttpClient } from '@angular/common/http';
import { throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

export abstract class Tagged {
    protected technologies: Technology[] = [];
    constructor(protected http: HttpClient) { }

    protected feedTechnologies(): void {
        const url = '/api/feed/technologies';

        this.http.post<any>(url, {}).pipe(
            catchError(error => {
                console.error('Error:', error);
                return throwError(error);
            })
        ).subscribe(data => {
            this.technologies = data;
        });
    }
}