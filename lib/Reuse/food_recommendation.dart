import 'package:flutter/material.dart';

class FoodRecommendations extends StatelessWidget {
  final String foodName;
  final int calories;

  const FoodRecommendations(
      {Key? key, required this.foodName, required this.calories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        // foodName + " has " + calories.toString() + " cals.",
        // style: const TextStyle(fontSize: 18, color: Colors.white),
        // ),
        Container(
          width: double.infinity,
          child: Expanded(
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 235, 251, 238),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    foodName +
                        " has " +
                        calories.toString() +
                        " cals per serving.",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 153, 115),
                      // rgb(43, 138, 62)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
