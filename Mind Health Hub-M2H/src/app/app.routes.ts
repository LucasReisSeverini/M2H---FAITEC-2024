import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { PesquisaComponent } from './pesquisa/pesquisa.component';
import { CadastroPsicologoComponent } from './cadastro-psicologo/cadastro-psicologo.component';
import { CadastroUsuarioComponent } from './cadastro-usuario/cadastro-usuario.component';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AgendamentoComponent } from './agendamento/agendamento.component';

export const routes: Routes = [
   { path: 'login', component: LoginComponent },
   { path: 'pesquisa', component: PesquisaComponent },
   { path: 'cadastro-psicologo', component: CadastroPsicologoComponent },
   { path: 'cadastro-usuario', component: CadastroUsuarioComponent },
   { path: 'agendamento', component: AgendamentoComponent }
 ];


 @NgModule({
   declarations:[],
   imports: [RouterModule.forRoot(routes), BrowserModule, FormsModule, ReactiveFormsModule ],
   exports: [RouterModule],
   providers: [],
   bootstrap: []
 })
 export class AppRoutingModule { };
 export class AppModule { };
