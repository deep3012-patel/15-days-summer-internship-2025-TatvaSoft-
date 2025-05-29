import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms'; // 👈 Import here
import { HeaderComponent } from './header/header.component'; // 👈 Import your HeaderComponent
import { FooterComponent } from './footer/footer.component';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,CommonModule,FormsModule,HeaderComponent,FooterComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  isvisible=false;
  title = 'gcet';
  value=['item-1','item-2','item-3']
  inputvalue='';

  loginData = {
    email: '',
    password: '',
  };

  onLogin() {
    console.log('Login Info:', this.loginData);
  }

  listenclick(){
    // alert("click event trigered");
    this.isvisible=!this.isvisible;
  }
}
