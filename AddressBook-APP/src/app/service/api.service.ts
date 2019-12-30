import { Injectable } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
import { Contacts } from '../models/contacts';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  constructor(private http: HttpClient) { }
  coreUrl = 'http://localhost:5000/';

  httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };


  getContacts(): Observable<Contacts[]> {
    return this.http.get<Contacts[]>(this.coreUrl + 'api/Contacts/', this.httpOptions)
      .pipe(
        tap(() => console.log('Contacts feched')),
        catchError(this.handleError('getContacts', []))
      );
  }

  addContact(contact): Observable<Contacts> {
    return this.http.post<Contacts>(this.coreUrl + 'api/Contacts/Create', contact, this.httpOptions).pipe(
      tap(() => console.log(`added contact with id=${contact.id}`)),
      catchError(this.handleError<Contacts>('addContact'))
    );
  }

  deleteContact(id: number): Observable<Contacts> {
    return this.http.delete<Contacts>(this.coreUrl + 'api/Contacts/Delete/' + id, this.httpOptions).pipe(
      tap(_ => console.log(`deleted todo id=${id}`)),
      catchError(this.handleError<Contacts>('deletetodo'))
    );
  }

  getContact(id: number): Observable<Contacts> {
    return this.http.get<Contacts>(this.coreUrl + 'api/Contacts/Details/' + id).pipe(
      tap(_ => console.log(`fetched todo id=${id}`)),
      catchError(this.handleError<Contacts>(`getTodo id=${id}`))
    );
  }

  updateContact(id, contact): Observable<any> {
    return this.http.put(this.coreUrl + 'api/Contacts/Edit/', contact).pipe(
      tap(_ => console.log('Updated contact with id:' + id)),
      catchError(this.handleError)
    );
  }

  postSearch(searchText: string): Observable<Contacts[]> {
    console.log(searchText.length);
    if (searchText.length < 1) {
      return this.http.get<Contacts[]>(this.coreUrl + 'api/Contacts/', this.httpOptions)
      .pipe(
        tap(() => console.log('Contacts feched')),
        catchError(this.handleError('getContacts', []))
      );
    } else {
      return this.http.post<Contacts[]>(this.coreUrl + 'api/Contacts/Search/' + searchText , this.httpOptions)
      .pipe(
        tap(() => console.log('Search feched')),
        catchError(this.handleError('getContacts', []))
      );
    }
  }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    };

    // searchContacts(searchText) {
    //   return this.http.post(this.coreUrl + 'api/Contacts/Search/' + searchText, searchText)
    //     .pipe(map(
    //       response => {
    //         return response;
    //       }));
    // }
  }
}
