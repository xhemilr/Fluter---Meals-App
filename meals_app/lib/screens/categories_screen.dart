import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
//    Scaffold(
//      appBar: AppBar(
//        title:const Text("Meals App"),
//      ),
//      body:
      GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catItem) => CategoryItem(
                  id: catItem.id ,
                  title: catItem.title,
                  color: catItem.color,
                ))
            .toList(),
//      ),
    );
  }
}
