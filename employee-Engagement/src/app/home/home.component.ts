import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../employee.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{
  constructor(private service:EmployeeService,public route:Router) { }

  loginEnable:boolean
  ngOnInit(): void {
    let response2=this.service.getLogin()
    response2.subscribe((data1:any)=>this.loginEnable=data1.login)
  }

}
