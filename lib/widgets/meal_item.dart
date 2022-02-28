import 'package:flutter/material.dart';
import 'package:yum_meals/models/meal_model.dart';
import 'package:yum_meals/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //Title over the image
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 300,
                    //color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Duration
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  //Complexity
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                  ),
                  //Affordability
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
