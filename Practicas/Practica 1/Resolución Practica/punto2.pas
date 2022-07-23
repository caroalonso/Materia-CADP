{ 2. Realice un programa que lea un número real e imprima su valor absoluto. El valor
absoluto de un número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero
}

program punto2;
var
num:real
aux:real;
begin
 write('ingrese un numero real:');
 readln(num);
 if(num >= 0 )then 
   writeln('|',num,'|=',num)
 else
   aux:= num*(-1);
   writeln( '|',num,'|=',aux);
end.