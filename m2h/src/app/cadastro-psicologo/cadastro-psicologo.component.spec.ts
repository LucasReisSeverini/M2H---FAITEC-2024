import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroPsicologoComponent } from './cadastro-psicologo.component';

describe('CadastroPsicologoComponent', () => {
  let component: CadastroPsicologoComponent;
  let fixture: ComponentFixture<CadastroPsicologoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CadastroPsicologoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CadastroPsicologoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
