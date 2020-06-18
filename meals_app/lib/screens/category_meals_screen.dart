import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;


  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> filteredMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    filteredMeals = widget.availableMeals.where((element) =>
        element.categories.contains(categoryId)
    ).toList();
  }

//  void _removeMeal(String mealId){
//    setState(() {
//      filteredMeals.removeWhere((element) => element.id == mealId);
//    });
//  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index){
         return MealItem(
           id: filteredMeals[index].id,
           title: filteredMeals[index].title,
           affordability: filteredMeals[index].affordability,
           complexity: filteredMeals[index].complexity,
           duration: filteredMeals[index].duration,
           imageUrl: filteredMeals[index].imageUrl,
         );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
