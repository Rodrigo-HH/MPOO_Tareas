import 'dart:ui';
import 'package:flutter/material.dart';
////Tarea 2:
//Integrantes: 
//Hernandes Esteban Daniel; danylechuga00@gmail.com
//Hernández Hernández Rodrigo; masterm7481@gmail.com
//Zarate Carvajal Rodrigo;
//rodrigozar7@gmail.com
//Pimentel Hernández Marco Antonio; marcoaph421028214@gmail.com

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const KdefaultPaddin = 20.0;

void main() {
  runApp(Ejercicio3());
}

class Ejercicio3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext contyext) {
    return Scaffold();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KdefaultPaddin),
          child: Text(
            "Inicio",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KdefaultPaddin),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: KdefaultPaddin,
                  crossAxisSpacing: KdefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => 
                ItemCard(product: products[index], press: () => Navigator.push(context, 
                MaterialPageRoute(builder: (context) => DetailsScreen(Product: products[index],),)),)),
              ),
              ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    key: key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
          padding: EdgeInsets.all(KdefaultPaddin),
         // height: 180,
          //width: 160,
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(product.images),
        ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: KdefaultPaddin / 4),
          child: Text(
            product.title,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "\$${product.price}",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
    );
  }
}

class Body extends StatelessWidget {
  final Product product;

  const Body ({key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
               padding: EdgeInsets.only(top: size.height * 0.12,
               left: KdefaultPaddin,
               right: KdefaultPaddin,
               ),
                //height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(children: <Widget[
                  Description(product: product),
                ],
                ),
              ),
              ProductTitleWithImage(product: product)
            ],
          ),
        )
      ],
      ),
    );
  }
}

class Description extends StatefulWidget {
  const Description({
    key key,
  @required this.product,
  }): super (key: key);

  final Product product;

  @override 
  Widget build(BuildContext context){
    return Padding (
      padding: const EdgeInsets.symmetric(vertical: KdefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
      );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    key key,
    @required this.product,
  }) : super(key: key);
  
final Product product;
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPading),
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text( "Platillo",
              style: TextStyle(color: Colors.white)
              ),  
            Row(
              children:<Widget> [
               RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price:\n"),
                    TextSpan(text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}       

class DetailsScreen extends StatelessWidget {
  final Product Product;
  const DetailsScreen({key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class Product {
  final String images;
  final String title;
  final String description;
  final double price;
  final int id;

  Product({
    this.id = 0,
    this.images = 'assets/Images/',
    this.price = 0,
    this.description = "yolo",
    this.title = "title",
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Tacos al Pastor",
    price: 40.00,
    description: "Orden de 5 tacos al pastor, con cebolla cilantro, piñas, limón y salsa",
    images: "assets/Images/producto1.jpg",
  ),
  Product(
    id: 2,
    title: "nombre del platillo",
    price: 29.99,
    description: "Dos esquites en vaso (300 ml) con mayonesa, chile piquin, y limón.",
    images: "assets/Images/producto2.jpg",
  ),
  Product(
    id: 3,
    title: "Tamales",
    price: 60,
    description: "Cinco tamales de salva verde rellenos de pollo",
    images: "assets/image/producto3.jpg",
  ),
  Product(
    id: 4,
    title: "Chocolate",
    price: 20,
    description: "Bebida de chocolate en tasa de vidrio",
    images: "assets/image/producto4.jpg",
  ),
  Product(
    id: 5,
    title: "Chapulines",
    price: 50,
    description: "Chapulines tostados con nachos y guacamole",
    images: "assets/image/producto5.jpg",
  ),
  Product(
    id: 6,
    title: "Quesadillas imposibles",
    price: 35,
    description: "Descripción: Orden de tres quesadillas, pueden ser de papa, frijol,longaniza y de verduras (hongos, nopal, papalo) ninguna con queso por eso son imposibles, se entrega con una bolsita de salsita, otra bolsa de queso rayado y otra bolsa de crema.  Precio: 35 pesos ",
    images: "assets/image/producto6.jpg",
  ),
  Product(
    id: 7,
    title: "Tacos dorados",
    price: 50,
    description: "Orden de 6 tacos dorados ya sean de pollo o papa, queso, crema y lechuga al gusto",
    images: "assets/image/producto7.jpg",
  ),
  Product(
    id: 8,
    title: "Tostadas de tinga",
    price: 20.00,
    description: "Dos tostadas con tinga, la crema se esparce sobre la tostada y se le agrega queso y lechuga sobre la tinga",
    images: "assets/image/producto8.jpg",
  ),
  Product(
    id: 9,
    title: "Picaditas toluqueñas",
    price: 50.00,
    description: "Picadita con frijoles charros untados sobre la misma base, con chorizo encima y crema, cebolla y queso al gusto",
    images: "assets/image/producto9.jpg",
  ),
  Product(
    id: 10,
    title: "Corte de carne ",
    price: 3800,
    description: "Descripción: Carne de la marca Kobe, puede ser termino medio, tres cuartos, o coxion bleu.  Condimentada, con cebolla frita, limón y salsa roja. Precio 3800 pesos",
    images: "assets/image/producto10.jpg",
  ),
  Product(
    id: 11,
    title: "Cerveza Modelo de las azules",
    price: 100,
    description: "Descripción: Cerveza con 75 porciento de alcohol lite de 600 ml, si eres menor de edad no le piques a este producto. Precio 100 Pesos",
    images: "assets/image/producto11.jpg",
  ),
  Product(
    id: 12,
    title: "Bebida Peñafiel",
    price: 15,
    description: "Descripción: : Bebida carbonatada, no sabe bueno pero la gente lo compra, de 600 ml . Precio 15 pesos",
    images: "assets/image/producto12.jpg",
  ),
  Product(
    id: 13,
    title: "Pambazos",
    price: 30,
    description: "Descripción: Pambazo con papa, lechuga, longaniza, crema, queso rayado frijoles y cubierta de salsa roja especial. Precio 30 pesos ",
    images: "assets/image/producto13.jpg",
  ),
  Product(
    id: 14,
    title: "Alegria de amaranto",
    price: 15,
    description: "Descripción: Alegria de amaranto con una cubierta de cacahuate, pasas, nuez y pepitas. Precio: 15 pesos",
    images: "assets/image/producto14.jpg",
  ),
  Product(
    id: 15,
    title: "Churros Gigantes",
    price: 20,
    description: "Descripción: Churros azucarados de 30 cm, contiene cada bolsa: 10 Churros . Precio: 20 pesos ",
    images: "assets/image/producto15.jpg",
  ),
];
