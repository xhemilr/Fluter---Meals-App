import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Container(
        child: Center(
          child: Text("You have no favorites yet - start adding some!"),
        ),
      );
    }else{
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }

  }
}
