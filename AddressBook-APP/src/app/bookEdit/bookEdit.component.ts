import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators, NgForm} from '@angular/forms';
import { ApiService } from '../service/api.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Contacts } from '../models/contacts';

@Component({
  selector: 'app-bookEdit',
  templateUrl: './bookEdit.component.html',
  styleUrls: ['./bookEdit.component.css']
})
export class BookEditComponent implements OnInit {
  page = 4;
  contactForm: FormGroup;
  id: number = null;

  constructor(
    private formBuilder: FormBuilder,
    private activeAouter: ActivatedRoute,
    private router: Router,
    private api: ApiService
  ) { }

  ngOnInit() {
    this.getDetail(this.activeAouter.snapshot.params.id);

    this.contactForm = this.formBuilder.group({
      id: ['', Validators.compose([Validators.required])],
      firstName: ['', Validators.compose([Validators.required])],
      lastName: ['', Validators.compose([Validators.required])],
      address: ['', Validators.compose([Validators.required])],
      telephone: ['', Validators.compose([Validators.required])],
    });
  }

  getDetail(id) {
    this.api.getContact(id)
      .subscribe(data => {
        this.id = data.id;
        this.contactForm.setValue({
          id: data.id,
          firstName: data.firstName,
          lastName: data.lastName,
          address: data.address,
          telephone: data.telephone
        });
        console.log(data);
      });
  }
  updateContact(form: NgForm) {
    this.api.updateContact(this.id, form)
      .subscribe(res => {
          this.router.navigate(['/']);
        }, (err) => {
          console.log(err);
        }
      );
  }
}

