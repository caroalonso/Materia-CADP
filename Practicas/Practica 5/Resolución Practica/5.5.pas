{De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio }

Program Alocacion_Dinamica;
Type
  TEmpleado = record
    sucursal: char;                  // 1 byte
    apellido: string[25];             // 26 bytes (25 + 1 para la longitud)
    correoElectrónico: string[40];    // 41 bytes (40 + 1 para la longitud)
    sueldo: real;                     // 8 bytes
  end;

  Str50 = string[50];

Var
  alguien: TEmpleado;    // Variable de tipo TEmpleado (76 bytes)
  PtrEmpleado: ^TEmpleado; // Puntero a TEmpleado (4 bytes en sistemas de 32 bits)

Begin
  { Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I) }
  
  Readln( alguien.apellido );  
  { La lectura no afecta la memoria disponible, ya que `alguien` ya está reservada en memoria. 
    Memoria disponible: 400.000 bytes (II) }

  New( PtrEmpleado );  
  { Se reserva memoria dinámica para un `TEmpleado`, lo que ocupa 76 bytes adicionales.
    Nueva memoria disponible: 400.000 - 76 = 399.924 bytes (III) }

  Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );  
  Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );  
  { La lectura solo asigna valores a la memoria ya reservada, por lo que la cantidad de memoria no cambia.
    Memoria disponible: 399.924 bytes (IV) }

  Dispose( PtrEmpleado );  
  { Se libera la memoria asignada dinámicamente a `PtrEmpleado`, recuperando los 76 bytes.
    Nueva memoria disponible: 399.924 + 76 = 400.000 bytes (V) }
  
End.
