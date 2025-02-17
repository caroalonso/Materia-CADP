{5. Realizar un programa que lea y almacene la información de productos de un supermercado.
De cada producto se lee: 
código,
descripción, 
stock actual,
stock mínimo
precio. 
La lectura finaliza cuando se ingresa el código -1, que no debe procesarse.
Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}

program listas;
type
  str = string[30];

  productos = record
    codigo: integer;
    descripcion: str; 
    stock_actual: integer;
    stock_minimo: integer;
    precio: real; 
  end;

  lista = ^nodo;
  nodo = record
    elem: productos;
    sig: lista;
  end;

// PROCESOS  

procedure dos_minimos(l: lista; var cod1: integer; var cod2: integer; var min1: real; var min2: real);
begin
  if (l^.elem.precio < min1) then begin
    min2 := min1;
    min1 := l^.elem.precio;
    cod2 := cod1;
    cod1 := l^.elem.codigo;
  end
  else begin
    if (l^.elem.precio < min2) then begin 
      min2 := l^.elem.precio;
      cod2 := l^.elem.codigo;
    end;
  end;
end;      

function productos_pares(codigo: integer): boolean;
var
  contador: integer;
  dig: integer;
  cumple: boolean;
begin
  cumple := false;
  contador := 0;
  while (codigo <> 0) do begin
    dig := codigo mod 10;
    if ((dig mod 2) = 0) then begin
      contador := contador + 1;
    end;
    codigo := codigo div 10;
  end;  
  if (contador >= 3) then begin
    cumple := true;
  end;
  productos_pares := cumple;
end;   

function s_m(l: lista): integer;
begin
  if (l^.elem.stock_actual < l^.elem.stock_minimo) then begin
    s_m := 1;
  end
  else begin
    s_m := 0;
  end;
end;  

procedure recorrerlista(l: lista);
var
  cod1, cod2: integer;
  min1, min2: real;
  contador_elementos, stock_m: integer;
  porcentaje: real;
begin
  stock_m := 0;
  contador_elementos := 0;
  min1 := 9999;
  min2 := 9999;
  
  while (l <> nil) do begin
    contador_elementos := contador_elementos + 1;
    dos_minimos(l, cod1, cod2, min1, min2);
    
    // Imprimir productos con código compuesto por al menos 3 dígitos pares
    if (productos_pares(l^.elem.codigo)) then begin
      writeln('Descripción: ', l^.elem.descripcion);
    end;  
    
    // Contar productos con stock bajo mínimo
    stock_m := stock_m + s_m(l);
    l := l^.sig;
  end;
  
  // Imprimir códigos de los dos productos más económicos
  writeln('Códigos de los dos productos más económicos: ', cod1, ', ', cod2);
  
  // Calcular e imprimir porcentaje de productos con stock bajo mínimo
  porcentaje := (stock_m / contador_elementos) * 100;
  writeln('Porcentaje de productos con stock bajo mínimo: ', porcentaje:0:2, '%');
end;    

procedure agregaradelante(var l: lista; p: productos);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := p;
  nue^.sig := l;
  l := nue;
end; 

procedure leer_producto(var p: productos);
begin
  readln(p.codigo); 
  if (p.codigo <> -1) then begin
    readln(p.descripcion);
    readln(p.stock_actual);
    readln(p.stock_minimo);
    readln(p.precio);
  end;
end;    

procedure cargarlista(var l: lista);
var
  pro: productos;
begin 
  leer_producto(pro);
  while (pro.codigo <> -1) do begin
    agregaradelante(l, pro);
    leer_producto(pro);
  end;
end;    

// PROGRAMA PRINCIPAL
var
  l: lista;
begin
  l := nil;
  cargarlista(l); 
  recorrerlista(l);
end.  

    
       
