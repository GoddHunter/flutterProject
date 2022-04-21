import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myflutterapp/recipe.dart';
import 'package:myflutterapp/recipeScreen.dart';
//import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp()); //point d'entrée de l'appli
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //C'est notre application
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //pour retirer la bannière debug sur l'appli
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RecipeScreen(
          recipe: Recipe(
              "Pizza facile",
              "Par Obi One",
              "https://assets.afcdn.com/recipe/20160519/15342_w600.jpeg",
              "Faire cuire dans une poêle les lardons et les champignons.\n\nDans un bol, verser la boîte de concentré"
                  "de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate)"
                  "une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
              false,
              50)),
    );
  }
}
