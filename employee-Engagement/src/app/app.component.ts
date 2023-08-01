import { Component, OnInit } from '@angular/core';
import { EmployeeService } from './employee.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  title = 'employee-Engagement';
  message=""
  navEnable:boolean
  forgetEnable=false
  admin:any
  adminEnable=true
  adminref:Admin=new Admin()
  loginEnable:boolean

  logout(){
    this.service.updateloginfalse().subscribe()
    this.navEnable=false
    this.loginEnable=false
    this.route.navigate([''])
  }

  checklogin(){
    if(this.admin.name==this.adminref.name && this.admin.password==this.adminref.password){
      this.message=""
      this.adminEnable=false
      this.navEnable=true
      this.loginEnable=true
      this.service.updatelogintrue().subscribe()
    }
    else{
      this.message="Incorrect login details"
    }
  }
  forget(){
    this.forgetEnable=true
    this.adminEnable=false
  }
  resetmessage=""
  errormessage=""
  newpass:string
  confirmpass:string
  reset(){
    if(this.newpass==this.confirmpass){
      this.admin.password=this.newpass
      let response=this.service.updateAdmin(this.admin)
      response.subscribe();
      this.newpass=""
      this.confirmpass=""
      this.ngOnInit;
      this.errormessage=""
      this.resetmessage="Reset Successful"
    }
    else{
      this.resetmessage=""
      this.errormessage="Password mismatch"
    }
    
  }
  search:number
  searchEmp(){
    let response=this.service.updateDataTrue(this.search)
    response.subscribe((data:any)=>this.admin=data)
    this.route.navigate(['employees'])
  }

  login(){
    this.resetmessage=""
    this.errormessage=""
    this.forgetEnable=false
    this.adminEnable=true
  }

constructor(public service:EmployeeService , public route:Router){}

  ngOnInit(): void {
    let response=this.service.getadmin()
    response.subscribe((data:any)=>this.admin=data)
    let response2=this.service.getLogin()
    response2.subscribe((data1:any)=>this.loginEnable=data1.login)
    let response3=this.service.getLogin()
    response3.subscribe((data1:any)=>this.navEnable=data1.login)
  }
}
 
class Admin{
  name:string
  password:string
}
