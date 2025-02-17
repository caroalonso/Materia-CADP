{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar 
proyectos de investigación avanzada. 
Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han determinado los siguientes criterios:

- SOLO se FINANCIARA proyectos cuyo costo de mantenimiento no supere el costo de construcción.

- NO se FINANCIARA proyectos espaciales que analicen ONDAS DE RADIO, (cat.1)
  ya que esto puede realizarse desde la superficie terrestre con grandes antenas.
  
  A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar un programa que:
 
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos criterios H2020.

b. Utilizando el módulo desarrollado en A) implemente un módulo que procese la lista de sondas de la ESA y retorne dos listados,
uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.

c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad 
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. 
Para ello, utilice el módulo realizado en B.}


program listas;
type
    rango=1..7;
    str20=string[20];
    InfoSonda = record
        nombre:str20;
        duracion:integer;
        costo_construccion:real;
        costo_mensual:Real;
        rango_espectro:rango;
    end;

    lista = ^nodo;
    nodo = record
        sonda : InfoSonda;
        sig : lista;
    end;
    lista2 =^nodo2;
    nodo2 = record
        Nombre: str20;
        sig2:lista2;
    end;
    vector_contador = Array [1..7] of integer;

procedure armarNodo(var L: lista; v: InfoSonda);
var
aux:lista;
begin
    new(aux);
    aux^.Sonda := v;
    aux^.sig := L;
    L := aux;
end;

procedure armarNodo2(var l: lista2; v: str20);
var
aux:lista2;
begin
    new(aux);
    aux^.Nombre := v;
    aux^.sig2 := l;
    l := aux;
end;

procedure leerSonda(var sondaInfo: InfoSonda);
begin
    with sondaInfo do
    begin
        writeLn('nombre de la sonda:'); 
        readLn(nombre);
        if (sondaInfo.nombre <> 'GAIA') then begin
            writeLn('duracion en meses:'); 
            readLn(duracion);
            writeLn('costo de construccion:'); 
            readLn(costo_construccion);  
            writeLn('costo de mantenimiento mensual:'); 
            readLn(costo_mensual);
            writeLn('rango del espectro electromacnetico:'); 
            readLn(rango_espectro);
        end;  
    end;
end;

procedure CargarLista(var ListaPrincipal: lista; var Sonda: InfoSonda);
begin
    writeln('ingrese una nueva sonda: (finalizacion sonda GAIA)');
    leerSonda(Sonda);
    while (Sonda.nombre <> 'GAIA') do
       begin
        armarNodo(ListaPrincipal, Sonda);
        writeln('ingrese una nueva sonda:(finalizacion sonda GAIA)');
        leerSonda(Sonda);
    end;
end;

procedure SondaMasCara(ListaPrincipal: lista; var NombreSondaCostosa: str20; var costoMaximo: real);
begin
    if (ListaPrincipal^.Sonda.costo_construccion > costoMaximo) then begin
        costoMaximo := ListaPrincipal^.Sonda.costo_construccion;
        NombreSondaCostosa := ListaPrincipal^.Sonda.nombre;
    end;
end;

procedure InicializarContadores(var contadores: vector_contador);
var
i: integer;
begin
    for i := 1 to 7 do begin
        contadores[i] := 0;
    end;
end;

procedure imprimirContadores(contadores: vector_contador);
var
i: integer;
begin
    for i := 1 to 7 do begin
        writeLn('En el rango ', i, ' se encontraron ', contadores[i], ' sondas.');
    end;
end;

procedure MayorDuracionPromedio(ListaPrincipal: lista; promedioDuracion: real; var cantidadSuperaPromedio: integer; costoPromedio: real; var listaSondasCostosas: lista2);
var
nombre: str20;
begin
    while ListaPrincipal <> Nil do begin
          if (ListaPrincipal^.Sonda.duracion > promedioDuracion) then 
             cantidadSuperaPromedio := cantidadSuperaPromedio + 1;

          if (ListaPrincipal^.Sonda.costo_construccion > costoPromedio) then begin
              nombre := ListaPrincipal^.Sonda.nombre;
              armarNodo2(listaSondasCostosas, nombre);
          end;
          ListaPrincipal := ListaPrincipal^.sig;
    end;
end;

function CumpleCondicion(ListaF: lista): boolean;
begin
    if (ListaF^.Sonda.costo_mensual < ListaF^.Sonda.costo_construccion) and (ListaF^.Sonda.rango_espectro <> 1) then
        CumpleCondicion := true
end;

procedure SepararSondasCumpleCondicion(ListaPrincipal: lista; var ListaCumple, ListaNoCumple: lista2);
var
cumple: boolean;
nombreCumple: str20;
nombreNoCumple: str20;
begin
  cumple := false;
  while ListaPrincipal <> nil do begin
      cumple := CumpleCondicion(ListaPrincipal);
      if (cumple = False) then  begin
          nombreNoCumple := ListaPrincipal^.Sonda.nombre;
          armarNodo2(ListaNoCumple, nombreNoCumple);
      end
      else begin
          nombreCumple := ListaPrincipal^.Sonda.nombre;
          armarNodo2(ListaCumple, nombreCumple);
          cumple := false;
      end;
      ListaPrincipal := ListaPrincipal^.sig;
  end;
end;

var
ListaPrincipal : lista;
Sonda: InfoSonda;
NombreSondaCostosa: str20;
maximo: real;
contadores: vector_contador;
tipo: integer;
promedio: real;
cantidadSondas: integer;
sumaDuracionSondas: real;
cantidadSuperaPromedio: integer;
primerElemento: lista;
costoPromedio: real;
costoTotal: real;
listaSondasCostosas: lista2;
ListaCumple: lista2;
ListaNoCumple: lista2;
Cumple: boolean;
begin
    ListaCumple := nil;
    ListaNoCumple := nil;
    Cumple := False;
    listaSondasCostosas := Nil;
    costoTotal := 0;
    costoPromedio := 0;
    cantidadSuperaPromedio := 0;
    sumaDuracionSondas := 0;
    cantidadSondas := 0;
    promedio := 0;
    ListaPrincipal := nil;
    maximo := -1;
    CargarLista(ListaPrincipal, Sonda);
    primerElemento := ListaPrincipal;
    
    InicializarContadores(contadores);
    while (ListaPrincipal <> nil) do
    begin
        SondaMasCara(ListaPrincipal, NombreSondaCostosa, maximo); // Sonda más costosa
        tipo := ListaPrincipal^.Sonda.rango_espectro; // Contar sondas por rango
        contadores[tipo] := contadores[tipo] + 1;
        cantidadSondas := cantidadSondas + 1; // Contar total de sondas
        sumaDuracionSondas := sumaDuracionSondas + ListaPrincipal^.Sonda.duracion; // Sumar duraciones
        costoTotal := costoTotal + ListaPrincipal^.Sonda.costo_construccion; // Sumar costos de construcción
        ListaPrincipal := ListaPrincipal^.sig;
    end;
    
    costoPromedio := costoTotal / cantidadSondas;
    writeln('sonda mas costosa: ', NombreSondaCostosa);
    
    WriteLn('cantidad de sondas por rango:');
    imprimirContadores(contadores); // Imprimir cantidad por rango

    promedio := sumaDuracionSondas / cantidadSondas; // Promedio de duración de sondas
    ListaPrincipal := primerElemento; // Volver al primer elemento
    
    MayorDuracionPromedio(ListaPrincipal, promedio, cantidadSuperaPromedio, costoPromedio, listaSondasCostosas); // Mayor duración

    WriteLn('cantidad de sondas que superan el tiempo promedio: ', cantidadSuperaPromedio);
    SepararSondasCumpleCondicion(ListaPrincipal, ListaCumple, ListaNoCumple); // Sondas que cumplen la condición
end.



