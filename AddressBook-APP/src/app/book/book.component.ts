import { Component, OnInit } from '@angular/core';
import { ApiService } from '../service/api.service';
import { Contacts } from '../models/contacts';


@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: ['./book.component.css']
})
export class BookComponent implements OnInit {
  data: Contacts[] = [];
  search: string;
  constructor(private api: ApiService) { }

  ngOnInit() {
    this.getContacts();
  }

  getContacts() {
    this.api.getContacts()
      .subscribe(res => {
        this.data = res;
      }, err => {
        console.log(err);
      });
  }

  deleteContact(id, contactFirst, contactLast) {
    const ans = confirm('Do you want to delete contact: ' + contactFirst + ' ' + contactLast + '?');
    if (ans) {
      this.api.deleteContact(id)
      .subscribe(res => {
          this.getContacts();
        }, (err) => {
          console.log(err);
        }
      );
    }
  }

  searchValues() {
    this.api.postSearch(this.search)
      .subscribe(res => {
        this.data = res;
      }, err => {
        console.log(err);
      });
  }

}
