{Dado el siguiente programa:}

program sumador;
type
  vnums = array [1..10] of integer;
  var
  numeros : vnums;
  i : integer;
begin
  for i:=1 to 10 do {primer bloque for}
    numeros[i] := i;

  for i := 2 to 10 do {segundo bloque for}
    numeros[i] := numeros[i] + numeros [i-1]
end.


{ Respuestas: 
  
  a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
  
  Al finalizar el primer bloque `for`, los valores de la variable `numeros` serán los números enteros del 1 al 10:
  numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  
  b) Al terminar el programa, ¿con qué valores finaliza la variable números?
  
  Al ejecutar el segundo bloque de `for`, los valores de la variable `numeros` se acumulan sumando cada valor con el anterior:
  numeros = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]
  
  c) Si se desea cambiar la línea 11 por la sentencia: for i := 1 to 9 do
     ¿Cómo debe modificarse el código para que la variable números contenga los mismos valores que en 1.b)?
  
  Para que el código funcione de manera similar y se obtengan los mismos valores que en 1.b), se puede realizar un ajuste en la segunda línea `for i := 1 to 9 do`. El bloque de código quedaría así:
  
  ```pascal
  for i := 1 to 9 do begin
    numeros[i+1] := numeros[i] + numeros[i+1];
  end;
  
  }