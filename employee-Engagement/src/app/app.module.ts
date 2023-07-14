import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeesComponent } from './employees/employees.component';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeService } from './employee.service';
import { HttpClientModule } from '@angular/common/http';
import { HomeComponent } from './home/home.component';

const routes:Routes=[
  
    {path:'employees',component:EmployeesComponent},
    {path:'home',component:HomeComponent},
    {path:'http://localhost:4200',component:AppComponent}
  
]

@NgModule({
  declarations: [
    AppComponent,
    EmployeesComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(routes)
  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent]
})
export class AppModule { }
