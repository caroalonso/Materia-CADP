{2.Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores:}

program ejercicio2;
type 

lista = ^nodo; 

persona = record 
   dni: integer; 
   nombre: string; 
   apellido: string; 
end; 

nodo = record 
  dato: persona; 
  sig: lista; 
end; 

// 3. `p` debe pasarse por referencia (`var`), ya que queremos modificar su contenido fuera de la función.
procedure leerPersona(var p: persona);  
begin 
  read(p.dni); 
  if (p.dni <> 0) then begin 
     read(p.nombre); 
     read(p.apellido); 
  end; 
end; 

{Agrega un nodo a la lista} 
// 4. `l` debe pasarse por referencia (`var`) para modificar la lista original.
procedure agregarAdelante(var l: lista; p: persona);  
var 
  aux: lista; 
begin 
  new(aux); // 5. Falta la asignación de memoria para `aux` con `new(aux)`.
  aux^.dato := p;
  aux^.sig := l; 
  l := aux; 
end;

{Carga la lista hasta que llega el dni 0} 
procedure generarLista(var l: lista);  
var 
  p: persona;  // 2. `p` debe ser de tipo `persona`, no de tipo `nodo`.
begin 
  leerPersona(p);
  while (p.dni <> 0) do begin 
    agregarAdelante(l, p); 
    leerPersona(p); // 6. Falta volver a leer `p` en cada iteración para continuar la carga.
  end; 
end; 

{Imprime la información de la lista}
procedure imprimirInformacion(l: lista);  
begin 
  while (l <> nil) do begin
    writeln('DNI: ', l^.dato.dni, ' Nombre: ', l^.dato.nombre, ' Apellido: ', l^.dato.apellido);  
    // 8. Se debe acceder a `nombre` y `apellido` a través de `l^.dato`
    l := l^.sig; 
  end;
end;

{Programa principal} 
var 
  l: lista; 
begin 
  l := nil; // 1. Falta inicializar `l` en `nil` antes de su uso.
  generarLista(l);
  imprimirInformacion(l); 
end.










