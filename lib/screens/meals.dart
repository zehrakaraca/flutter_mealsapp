import 'package:flutter/material.dart';
import 'package:mealsapp/data/meal_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meal_details.dart';
import 'package:mealsapp/widgets/meal_card.dart';

class Meals extends StatelessWidget {
  const Meals({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Meal> mealList =
        meals.where((element) => element.categoryId == category.id).toList();

    Widget widget = ListView.builder(
      itemBuilder: (context, index) {
        return MealCard(
          meal: mealList[index],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: mealList[index]),
              ),
            );
          },
        );
      },
      itemCount: mealList.length,
    );

    if (mealList.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir yemek bulunamadı."),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("${category.name} Yemekleri")),
      body: widget,
    );
  }
}
