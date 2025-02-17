{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. 
De cada cliente se lee:
código de cliente
DNI
apellido
nombre
código de póliza contratada (1..6)
monto básico que abona mensualmente. 

La lectura finaliza cuando llega el cliente con código 1122, el cual debe procesarse.

La empresa DISPONE de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.

Una vez finalizada la lectura de todos los clientes, se pide:

a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.

c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura. }

program listas_repaso;
const
  dimf =6;
type
  rango =1..dimf;
  str=string[30];
  
  vector= array [rango] of real;
  
  clientes=record
    cod:integer;
    dni:integer;
    apellido:str;
    nombre:str;
    cod_poli:rango;
    basico:real;
  end;
  
  lista=^nodo ;
  
  nodo=record
    elem:clientes;
    sig:lista;
  end;  
  
//procesos

procedure inicializar_vec(var v : vector ) ;//ya se dispone
begin
end; 

procedure leer(var cli:clientes);
begin
   readln(cli.cod);
   readln(cli.dni);
   readln(cli.apellido);
   readln(cli.nombre);
   readln(cli.cod_poli);
   readln(cli.basico);
end;   


procedure A (clien:clientes;vec:vector);
var
con:real;
begin
  con:=clien.basico + vec[clien.cod_poli];
  writeln('dni: ', clien.dni);
  writeln('nombre: ', clien.nombre);
  writeln('apellido: ', clien.apellido);
  writeln('monto total mensual: ', con:0:2);
end;


function B(num:integer):boolean;
var
dig:integer;
contador:integer;
cumple:boolean;
begin
 cumple:=false;
 contador:=0;
 while(num<>0)and(contador<>2)do begin
   dig:= num mod 10;
   if (dig=9)then begin
     contador:=contador+1;
   end;
   num:=num div 10;
 end;
 if(contador=2)then begin
   cumple:=true;
 end; 
 B:=cumple;
end; 
         
 
procedure agregar_adelante (var l :lista ; c:clientes);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=c;
  nue^.sig:=l;
  l:=nue;
end;  


procedure leer_info (var l:lista;vec:vector);
var
cli:clientes;
begin
  repeat 
    leer(cli);
    A(cli,vec);
    if(B(cli.dni))then begin;
      writeln(cli.nombre);
      writeln(cli.apellido);
    end;
    agregar_adelante(l,cli);
  until(cli.cod=1122);
end;   


procedure eliminar(var l :lista ; num :integer);
var
act:lista;
ant:lista;
begin
  act:=l;
  while (act <> nil)and (act^.elem.cod <> num)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    if (act=l)then begin
      l:=l^.sig;
    end
    else begin
      ant^.sig:=act^.sig;
    end;      
    dispose (act);
  end;
end;        
            
  
//programa principal
var
l:lista;
ve:vector;
cod_num:integer;
begin
  l:=nil;
  inicializar_vec(ve);  // ya se dispone
  leer_info (l,ve); 
  read(cod_num);
  eliminar (l,cod_num);
end.         
