// Nombres de los integrantes:
//González García David Elias | Correo: pineco2510@gmail.com
//Hernández Hernández Rodrigo | Correo: Masterm7481@gmail.com
//López Tinajero Luis Eduardo | Correo: luislopez_tinajero@hotmail.com
//López Pitalúa Sandra Jazmín

class Automovil{
  String _marca = "Ferrari";
  int precio = 0;
  String _dueno = "Enzo Ferrari";
  bool pagoDiferido = true;

  void arrancar(String arranca){
  print("$arranca");
  }

  void frenar(String frena){
  print("$frena");
  }

}

void main() 
{
final auto = Automovil();

auto.precio = 3500000;
print(auto.precio);

if (auto.pagoDiferido == true){
  print(auto.pagoDiferido);
}

auto.arrancar("En marcha");

auto.frenar("Frena");

}
