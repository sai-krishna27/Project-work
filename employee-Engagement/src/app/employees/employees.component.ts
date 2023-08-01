import { Router } from '@angular/router';
import { Component } from '@angular/core';
import { EmployeeService } from '../employee.service';
import { Employee } from 'employee';

@Component({
  selector: 'app-employees',
  templateUrl: './employees.component.html',
  styleUrls: ['./employees.component.css']
})
export class EmployeesComponent {
  getEnable=true
  employees:any
  addEnable=false
  viewEnable=false
  editEnable=false

  tempemployee:Employee=new Employee()

  addEmployee(){
    let response=this.service.addemployees(this.tempemployee);
    response.subscribe();
    this.ngOnInit()
    this.addEnable=false
    this.ngOnInit()
    this.getEnable=true
    this.tempemployee=new Employee()
  }

  tempview:Employee=new Employee()
  viewdetails(employee:any){
    this.tempview=employee
    this.viewEnable=true
    this.getEnable=false
  }

  addNewEmployee(){
    this.getEnable=false
    this.addEnable=true
  }

  getemps(){
    this.viewEnable=false
    this.service.getemployees().subscribe((data3:any)=>this.employees=data3)
    this.getEnable=true
  }

  editemps(){
    this.viewEnable=false
    this.editEnable=true
  }
  updateEmployee(){
    let response=this.service.updateemployee(this.tempview);
    response.subscribe();
    this.editEnable=false
    this.viewEnable=true
  }

  deleteEmployee(id:number){
    let response=this.service.deleteemployee(id);
    response.subscribe()
    this.ngOnInit()
    this.viewEnable=false
    this.ngOnInit()
    this.getEnable=true
  }



  constructor(private service:EmployeeService,public route:Router) { }

  loginEnable:boolean
  data:boolean
  ngOnInit(): void {
    let response2=this.service.getLogin()
    response2.subscribe((data1:any)=>this.loginEnable=data1.login)
    let response=this.service.getData();
    response.subscribe((data:any)=>{
      if(data.hasdata){
        var id=parseInt(data.data)
        this.service.getEmployeeById(id).subscribe((data2:any)=>this.tempview=data2)
        this.service.updateDataFalse().subscribe()
        this.viewEnable=true
        this.getEnable=false
        
      }
      else{
        this.service.getemployees().subscribe((data3:any)=>this.employees=data3)
        this.viewEnable=false
        this.getEnable=true
      }
    });
  }
}
