import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { BookComponent } from './book/book.component';
import { BookAddComponent } from './bookAdd/bookAdd.component';
import { BookEditComponent } from './bookEdit/bookEdit.component';

const routes: Routes = [
  {
    path: '',
    component: BookComponent,
    data: { title: 'List of contacts' }
  },
  {
    path: 'book/add',
    component: BookAddComponent,
    data: { title: 'Add contact' }
  },
  {
    path: 'book/edit/:id',
    component: BookEditComponent,
    data: { title: 'Edit contact' }
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
