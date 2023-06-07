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

{
respuestas:
1.a) tomara el valor nuemro 10 .
1.b) 1,3,6,10,15,21,28,36,45,55.
1.c) for i := 1 to 9 do begin
     numeros[i+1]:= nuemeros [i]+ numeros[i+1];
   end;
1.d) 1,1,1,1,1,1,1,1,1,1
}
