import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { ApiService } from '../service/api.service';
import {Router} from '@angular/router';

@Component({
  // tslint:disable-next-line: component-selector
  selector: 'app-bookAdd',
  templateUrl: './bookAdd.component.html',
  styleUrls: ['./bookAdd.component.css']
})
export class BookAddComponent implements OnInit {

  contactForm: FormGroup;
  constructor(private formBuilder: FormBuilder, private router: Router, private api: ApiService) { }

  ngOnInit() {
    this.contactForm = this.formBuilder.group({
      firstName: ['', Validators.compose([Validators.required])],
      lastName: ['', Validators.compose([Validators.required])],
      address: ['', Validators.compose([Validators.required])],
      telephone: ['', Validators.compose([Validators.required])],
    });
  }

  addContact() {
    const payload = {
      firstName: this.contactForm.controls.firstName.value,
      lastName: this.contactForm.controls.lastName.value,
      address: this.contactForm.controls.address.value,
      telephone: this.contactForm.controls.telephone.value,
    };

    this.api.addContact(payload)
      .subscribe(() => {
          this.router.navigate(['/']);
        }, (err) => {
          console.log(err);
        });
  }

  cancel() {
    this.router.navigate(['/']);
  }

}
