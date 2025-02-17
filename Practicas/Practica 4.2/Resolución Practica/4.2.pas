{2.Realice un programa que resuelva los siguientes incisos:

a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.

Nota: Realizar todas las validaciones necesarias.}

program vectores;

const
  dimf = 500;

type
  str = string[20];
  vector = array[1..dimf] of str;

// Módulos

// A: Cargar vector con nombres
procedure A_cargar_nombres(var v: vector; var diml: integer); 
var
  nom: str;
begin
  readln(nom);
  while (diml < dimf) and (UpperCase(nom) <> 'ZZZ') do 
  begin
    diml := diml + 1;
    v[diml] := nom;
    readln(nom);
  end;
end; 

// Eliminar un elemento por su posición
procedure eliminar(var v: vector; diml: integer; pos: integer); 
var
  i: integer;
begin
  for i := pos to diml - 1 do 
    v[i] := v[i + 1];
end;

// B: Eliminar un nombre
procedure B_eliminar_nombre(var v: vector; var diml: integer; nom: str);
var
  pude: boolean;
  pos: integer;
begin
  pude := false;
  pos := 1;
  while (pos <= diml) and (v[pos] <> nom) do 
    pos := pos + 1;

  if (pos <= diml) and (v[pos] = nom) then 
  begin
    eliminar(v, diml, pos);
    diml := diml - 1;
    pude := true;
  end;

  if (pude) then 
    writeln('Se pudo eliminar correctamente el elemento ', nom)
  else 
    writeln('No se pudo borrar el elemento ', nom);
end;          

// C: Insertar un elemento en una posición X
procedure C_insertar_elemento_posicion(var v: vector; var diml: integer; nom: str; pos: integer);
var
  i: integer;
  pude: boolean;
begin
  pude := false;
  if (diml < dimf) and (pos >= 1) and (pos <= diml + 1) then 
  begin
    for i := diml downto pos do 
      v[i + 1] := v[i]; 
    v[pos] := nom;  
    diml := diml + 1;
    pude := true;
  end;

  if (pude) then 
    writeln('Se pudo cargar el nombre ', nom, ' correctamente en la posición ', pos)
  else 
    writeln('No se pudo cargar el nombre ', nom, ' correctamente en la posición ', pos);    
end;       

// D: Agregar un elemento al final del vector
procedure D_agregar_un_elemento(var v: vector; var diml: integer; nom: str);
var
  pude: boolean;
begin
  pude := false;
  if (diml < dimf) then 
  begin
    diml := diml + 1;
    v[diml] := nom;
    pude := true;
  end;

  if (pude) then 
    writeln('Se pudo cargar el nombre correctamente')
  else 
    writeln('El nombre ingresado no se pudo cargar correctamente');    
end;       

// Programa principal
var
  diml: integer;
  v: vector;
  nombre: str;
  pos: integer;
begin
  diml := 0;
  pos := 4;  // Se asume que se va a insertar en la posición 4
  A_cargar_nombres(v, diml);  // A
  readln(nombre);  // B
  B_eliminar_nombre(v, diml, nombre);
  readln(nombre);  // C
  C_insertar_elemento_posicion(v, diml, nombre, pos);
  readln(nombre);  // D
  D_agregar_un_elemento(v, diml, nombre);
end.  

