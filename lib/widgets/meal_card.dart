import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap; // Tıklama callback'i için ekleme

  const MealCard({Key? key, required this.meal, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell widget'ını ekleyerek tıklama özelliği ekliyoruz.
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  child: Center(
                      child: Text(
                    meal.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
