import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/filterscreen.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element){
        if(_filters['gluten'] && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !element.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !element.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((element) => element.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
//      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/' : (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName : (_) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (_) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName : (_) => FilterScreen(_filters, _setFilters),
      },
//      onGenerateRoute: (settings) {
//        print(settings.arguments);
//        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
//      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context)=>CategoryMealsScreen(_availableMeals));
      },
    );
  }
}
