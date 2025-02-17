{4. Una maternidad dispone información sobre sus pacientes. 
De cada una se conoce: 
nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). 
La maternidad necesita un programa que analice esta información, determine e informe:

a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program listas_repaso;
const
  dimf = 42;
type
  str = string[30];

  vector = array[1..dimf] of real;

  madres = record
    nombre: str;
    apellido: str;
    semanas: vector;
  end;

  lista = ^nodo;

  nodo = record
    elem: madres;
    sig: lista;
  end;

//procesos
procedure cargar_madres(var l: lista; var ve: vector); // ya se dispone
begin
end;

procedure A_B(ve: vector; var peso_total: real; var sem: integer);
var
  i: integer;
  max: real;
  aumento: real;
begin
  max := -1;
  peso_total := 0;
  for i := 2 to dimf do begin  // Comienza en 2 para comparar con la semana anterior
    aumento := ve[i] - ve[i - 1];  // Calcula el aumento de peso
    peso_total := peso_total + ve[i];  // Acumula el peso total
    if aumento > max then begin
      max := aumento;  // Actualiza el aumento máximo
      sem := i;  // Guarda la semana con el mayor aumento
    end;
  end;
end;

procedure procesar(l: lista);
var
  peso_total: real;
  sem: integer;
begin
  while (l <> nil) do begin
    peso_total := 0;
    sem := 0; // Asegurarse de que la semana esté inicializada
    A_B(l^.elem.semanas, peso_total, sem);
    writeln('El peso total de ', l^.elem.nombre, ' fue de: ', peso_total:0:2);
    writeln('Para ', l^.elem.nombre, ' la semana con mayor aumento de peso fue 

 
