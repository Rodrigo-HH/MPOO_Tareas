import 'dart:io';

int a=0;
int b=1;
int d=0;

int Fibonacci(){
  d=a+b;    
  a=b;
  b=d;
  return d;
}

void main(){
  print('Inserte un valor para la sucesion');
  int? n = int.parse(stdin.readLineSync()!);
  int c;
  for (c = 1; c <= n; c++){
    print(Fibonacci());
    }
}
