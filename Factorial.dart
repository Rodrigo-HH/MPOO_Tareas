import 'dart:io';

int a=1;
int b=1;

int Factorial(int n){
int c;
for (c = 1; c <= n; c++){
b=a*c;
a=b;
}
return b;
}

void main(){
print('Inserte un valor para calcular el factorial');
int? n = int.parse(stdin.readLineSync()!);
if (n>=0){
print(Factorial(n));
}
else {
print('Valor invalido');
}
}
