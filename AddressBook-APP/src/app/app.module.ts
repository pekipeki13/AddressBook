import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { BookComponent } from './book/book.component';
import { BookAddComponent } from './bookAdd/bookAdd.component';
import { BookEditComponent } from './bookEdit/bookEdit.component';
import { HttpClientModule } from '@angular/common/http';
import { NgxPaginationModule } from 'ngx-pagination';


@NgModule({
   declarations: [
      AppComponent,
      BookComponent,
      BookAddComponent,
      BookEditComponent
   ],
   imports: [
      HttpClientModule,
      BrowserModule,
      AppRoutingModule,
      NgbModule,
      ReactiveFormsModule,
      NgxPaginationModule,
      FormsModule
   ],
   providers: [ ],
   bootstrap: [
      AppComponent
   ]
})
export class AppModule { }
