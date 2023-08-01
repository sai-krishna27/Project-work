import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  constructor(private http:HttpClient) { }


  public addemployees(employee:any){
    return this.http.post("http://localhost:3000/employees",employee,{responseType:'text' as 'json'});
  }

  public getemployees(){
    return this.http.get("http://localhost:3000/employees");
  }


  public deleteemployee(id:any){
    return this.http.delete("http://localhost:3000/employees/"+id);
  }


  public updateemployee(employee:any){
    return this.http.put("http://localhost:3000/employees/"+employee.id,employee,{responseType:'text' as 'json'});
  }

  public getadmin(){
    return this.http.get("http://localhost:3000/admin");
  }

  public updateAdmin(admin:any){
    return this.http.put("http://localhost:3000/admin",admin,{responseType:'text' as 'json'});
  }

  public getEmployeeById(id:number){
    return this.http.get("http://localhost:3000/employees/"+id)
  }

  public updatelogintrue(){
    return this.http.put("http://localhost:3000/islogin",{"login":true},{responseType:'text' as 'json'})
  }

  public getLogin(){
    return this.http.get("http://localhost:3000/islogin");
  }

  public updateloginfalse(){
    return this.http.put("http://localhost:3000/islogin",{"login":false},{responseType:'text' as 'json'})
  }

  public getData(){
    return this.http.get("http://localhost:3000/Data");
  }

  public updateDataTrue(ids:number){
    var id=""+ids
    return this.http.put("http://localhost:3000/Data",{"hasdata":true,"data":id},{responseType:'text' as 'json'})
  }
  public updateDataFalse(){
    return this.http.put("http://localhost:3000/Data",{"hasdata":false,"data":""},{responseType:'text' as 'json'})
  }

}
