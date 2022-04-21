import 'package:flutter/material.dart';
import 'package:myflutterapp/favoriteChangeNotifier.dart';
import 'package:myflutterapp/favoriteWidget.dart';

import 'recipe.dart';
import 'package:provider/provider.dart';


class RecipeScreen extends StatelessWidget {

  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

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
                child: Text(recipe.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )),
              ),
              Text(recipe.user, style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18
              )),
            ],
          )),
          FavoriteIconWidget(),
          FavoriteTextWidget()
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
      child: Text(recipe.description,
        softWrap: true,
        style: TextStyle(
          fontSize: 18,
        ),), //SoftWrap permet de ne pas couper les mots en plein milieu
    );


    return ChangeNotifierProvider(
      create: (context)=> FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Mes recettes"),
          ),
          body: ListView( //Permet d'avoir une vue scrollable en cas de débordement de texte
              children: [
                // Stack(children: [ //pour empiler 2 widgets : l'un sur l'autre
                //   Container(
                //     width: 600,
                //     height: 240,
                //     child: Center(child: CircularProgressIndicator()), //ajout d'un loader
                //   ),
                FadeInImage.assetNetwork( // pour faire un effet de fondu (une animation)
                  placeholder: 'images/loading.gif',
                  image: recipe.imageUrl,
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover, //permet d'afficher au mieux l'image
                ),
                titleSection,
                buttonSection,
                descriptionSection,
              ])// This trailing comma makes auto-formatting nicer for build methods.
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
