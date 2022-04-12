import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp()); //point d'entrée de l'appli
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(10), //implanter une marge tout autour
      child: Row(
        children: [
          Expanded(child: Column( //Expanded allows to get a large space
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text("Pizza facile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )),
              ),
              Text("Par Obi One", style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18
              ))
            ],
          )),
          Icon(Icons.favorite, color: Colors.red),
          Text("55"),
        ],
      ),
    );

    Widget buttonSection =
    Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Ajouter de l'espace entre les éléments un peu partout
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "COMMENT"),
          _buildButtonColumn(Colors.blue, Icons.share, "SHARE"),
        ],),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text("Faire cuire dans une poêle les lardons et les champignons. \nDans un bol, verser la boîte de concentré"
          "de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate)"
          "une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
      softWrap: true,
      style: TextStyle(
        fontSize: 18,
      ),), //SoftWrap permet de ne pas couper les mots en plein milieu
    );


    return MaterialApp( //C'est notre application
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //pour retirer la bannière debug sur l'appli
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Mes recettes"),
        ),
        body: ListView( //Permet d'avoir une vue scrollable en cas de débordement de texte
          children: [
              CachedNetworkImage( // pour faire un effet de fondu (une animation)
                imageUrl: 'https://assets.afcdn.com/recipe/20160519/15342_w600.jpg',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 600,
                height: 240,
                fit: BoxFit.cover, //permet d'afficher au mieux l'image
              ),
            titleSection,
            buttonSection,
            descriptionSection,
          ],
        )// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //centrer les éléments
      children: [ Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
      ),
        Text(label, style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: color,
        ),),
      ],
    );
  }

}
