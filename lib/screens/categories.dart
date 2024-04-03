import 'package:flutter/material.dart';
import 'package:mealsapp/data/category_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_card.dart';

// Global State - Global State Management
class Categories extends StatelessWidget {
  const Categories({super.key});

  void _changeScreen(Category c, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(category: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<Category> categoryList = categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoriler"),
        actions: [
          // TODO: Favoriler sayfasına geçiş..
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 5,
            childAspectRatio: 4 / 2),
        children: categoryList
            .map((e) => CategoryCard(
                  category: e,
                  onCategoryClick: () {
                    _changeScreen(e, context);
                  },
                ))
            .toList(),
      ),
    );
  }
}
