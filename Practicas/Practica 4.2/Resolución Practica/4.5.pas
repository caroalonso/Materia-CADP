{5.La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. 
De cada cliente conoce 
la fecha de firma del contrato con AWS, 
la categoría del monotributo (entre la A y la F), 
el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) 
y el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos
primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:
1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
2) Cantidad de clientes para cada categoría de monotributo
3) Código de las 10 ciudades con mayor cantidad de clientes
4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes. }

program AWS;
const
  dimf = 500; // Cantidad máxima de clientes
  max_ciudad = 2400; // Código de ciudad máximo

type
  str = string[20];

  // Registro que almacena la información de cada cliente
  cliente = record
    fecha_firma: string[7];  // Fecha de firma en formato 'yyyy-mm'
    categoria: char;         // Categoria de monotributo (A a F)
    ciudad_codigo: integer; // Código de ciudad (1 a 2400)
    monto: real;            // Monto mensual acordado
  end;

  // Vector de clientes
  vector = array[1..dimf] of cliente;

var
  clientes: vector;
  diml: integer;  // Cantidad de clientes cargados

// Procedimiento para leer un cliente
procedure leer_cliente(var c: cliente);
begin
  writeln('Ingrese la fecha de firma (yyyy-mm):');
  readln(c.fecha_firma);
  writeln('Ingrese la categoria (A-F):');
  readln(c.categoria);
  writeln('Ingrese el código de la ciudad (1-2400):');
  readln(c.ciudad_codigo);
  writeln('Ingrese el monto mensual acordado:');
  readln(c.monto);
end;

// Procedimiento para cargar los clientes
procedure cargar_clientes(var v: vector; var diml: integer);
var
  i: integer;
begin
  writeln('Ingrese la cantidad de clientes (máximo 500):');
  readln(diml);

  for i := 1 to diml do
  begin
    writeln('Ingrese los datos del cliente ', i, ':');
    leer_cliente(v[i]);
  end;
end;

// Función que retorna el año de la fecha de firma
function obtener_anio(fecha: string): integer;
begin
  val(copy(fecha, 1, 4), obtener_anio);
end;

// 1. Cantidad de contratos por cada mes y cada año, y año con más contratos
procedure contratos_por_mes_anno(var v: vector; diml: integer);
var
  i, ano, mes: integer;
  contratos_por_ano: array[1..9999] of integer; // Año máximo de 4 dígitos
  contratos_por_mes: array[1..12] of integer;  // 12 meses
  mayor_cantidad_ano, ano_maximo, total_anos: integer;
begin
  fillchar(contratos_por_ano, sizeof(contratos_por_ano), 0);
  fillchar(contratos_por_mes, sizeof(contratos_por_mes), 0);

  for i := 1 to diml do
  begin
    ano := obtener_anio(v[i].fecha_firma);
    contratos_por_ano[ano] := contratos_por_ano[ano] + 1;

    mes := StrToInt(copy(v[i].fecha_firma, 6, 2));
    contratos_por_mes[mes] := contratos_por_mes[mes] + 1;
  end;

  // Mostrar cantidad de contratos por mes
  writeln('Cantidad de contratos por mes:');
  for mes := 1 to 12 do
    writeln('Mes ', mes, ': ', contratos_por_mes[mes]);

  // Encontrar el año con más contratos
  mayor_cantidad_ano := 0;
  for ano := 1 to 9999 do
  begin
    if contratos_por_ano[ano] > mayor_cantidad_ano then
    begin
      mayor_cantidad_ano := contratos_por_ano[ano];
      ano_maximo := ano;
    end;
  end;
  
  writeln('El año con la mayor cantidad de contratos es ', ano_maximo, ' con ', mayor_cantidad_ano, ' contratos.');
end;

// 2. Cantidad de clientes por categoría de monotributo
procedure cantidad_clientes_categoria(var v: vector; diml: integer);
var
  i: integer;
  categoria_count: array['A'..'F'] of integer;
begin
  fillchar(categoria_count, sizeof(categoria_count), 0);

  for i := 1 to diml do
    categoria_count[v[i].categoria] := categoria_count[v[i].categoria] + 1;

  writeln('Cantidad de clientes por categoría de monotributo:');
  for i := ord('A') to ord('F') do
    writeln(chr(i), ': ', categoria_count[chr(i)]);
end;

// 3. Código de las 10 ciudades con mayor cantidad de clientes
procedure ciudades_con_mayor_cantidad(var v: vector; diml: integer);
var
  i, j, codigo_ciudad, mayor: integer;
  cantidad_ciudades: array[1..max_ciudad] of integer;
  ciudades_mayores: array[1..10] of integer;
begin
  fillchar(cantidad_ciudades, sizeof(cantidad_ciudades), 0);

  for i := 1 to diml do
    cantidad_ciudades[v[i].ciudad_codigo] := cantidad_ciudades[v[i].ciudad_codigo] + 1;

  writeln('Las 10 ciudades con mayor cantidad de clientes:');
  
  for i := 1 to 10 do
  begin
    mayor := 0;
    for j := 1 to max_ciudad do
    begin
      if cantidad_ciudades[j] > mayor then
      begin
        mayor := cantidad_ciudades[j];
        codigo_ciudad := j;
      end;
    end;
    
    ciudades_mayores[i] := codigo_ciudad;
    cantidad_ciudades[codigo_ciudad] := -1; // Marcar como procesado
    writeln(i, '. Ciudad código ', codigo_ciudad, ': ', mayor, ' clientes');
  end;
end;

// 4. Cantidad de clientes que superan el monto promedio
procedure clientes_superan_promedio(var v: vector; diml: integer);
var
  i: integer;
  total_monto: real;
  promedio: real;
  clientes_superan: integer;
begin
  total_monto := 0;
  
  // Calcular el monto total
  for i := 1 to diml do
    total_monto := total_monto + v[i].monto;

  // Calcular el monto promedio
  promedio := total_monto / diml;
  clientes_superan := 0;

  // Contar los clientes que superan el promedio
  for i := 1 to diml do
    if v[i].monto > promedio then
      clientes_superan := clientes_superan + 1;

  writeln('Cantidad de clientes que superan el monto promedio: ', clientes_superan);
end;

// Programa principal
begin
  diml := 0;
  cargar_clientes(clientes, diml);

  // Procesar la información y realizar los cálculos solicitados
  contratos_por_mes_anno(clientes, diml);
  cantidad_clientes_categoria(clientes, diml);
  ciudades_con_mayor_cantidad(clientes, diml);
  clientes_superan_promedio(clientes, diml);
end.
