{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. 
Para ello, se debe leer la información de los préstamos realizados. 
De cada préstamo se lee: 
nro. de préstamo, 
ISBN del libro prestado, 
nro. de
socio al que se prestó el libro, 
día del préstamo (1..31). 
La información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).

Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par}


program repaso_listas;
const
  dimF = 31;
type
  dias = 1..dimF;
  vectorContador = array[dias] of integer;
  prestamos = record
    prestamo: integer;
    isbn: integer;
    socio: integer;
    dia: dias;
  end;
  libro = record
    isbn: integer;
    cant_prestamos: integer;
  end;

  lista = ^nodo;
  nodo = record
    dato: libro;
    sig: lista;
  end;


procedure inicializarVector(var v: vectorContador);
var
  i: integer;
begin
  for i := 1 to dimF do
    v[i] := 0;
end;


procedure leer(var p: prestamos);
begin
  readln(p.isbn);
  if p.isbn <> -1 then begin
    readln(p.prestamo);
    readln(p.socio);
    readln(p.dia);
  end;
end;

procedure agregarAdelante(var l: lista; prestamos: integer; act: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato.isbn := act;
  nue^.dato.cant_prestamos := prestamos;
  nue^.sig := l;
  l := nue;
end;

procedure minimo(v: vectorContador);
var
  min, i: integer;
  dia: dias;
begin
  min := 9999;
  dia := -1;
  for i := 1 to dimF do begin
    if v[i] < min then begin
      min := v[i];
      dia := i;
    end;
  end;
  writeln('Día con menos préstamos: ', dia);
end;

function cumple(prestamo: integer; socio: integer): boolean;
begin
  cumple := (prestamo mod 2 <> 0) and (socio mod 2 = 0);
end;

procedure procesarInformacion(var l: lista; var v: vectorContador);
var 
  p: prestamos;
  act, cant_prestamos, totalPrestamos, nroImparPrestamoPar: integer;
begin
  totalPrestamos := 0;
  nroImparPrestamoPar := 0;
  leer(p);
  
  while (p.isbn <> -1) do begin
    act := p.isbn;
    cant_prestamos := 0;
    
    while (p.isbn <> -1) and (act = p.isbn) do begin
      totalPrestamos := totalPrestamos + 1;
      
      if cumple(p.prestamo, p.socio) then
        nroImparPrestamoPar := nroImparPrestamoPar + 1;
        
      cant_prestamos := cant_prestamos + 1;
      v[p.dia] := v[p.dia] + 1;
      
      leer(p);
    end;
    
    agregarAdelante(l, cant_prestamos, act);
  end;

  minimo(v);
  writeln('Porcentaje de préstamos con número de préstamo impar y socio par: ', 
          (nroImparPrestamoPar / totalPrestamos) * 100:2:2, '%');
end;

var
  l: lista;
  v: vectorContador;
begin
  l := nil;
  inicializarVector(v);
  procesarInformacion(l, v);		
end.
