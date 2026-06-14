import 'package:flutter/material.dart';
import '../../services/food_service.dart';

class AddFoodScreen
    extends StatefulWidget {
  const AddFoodScreen({
    super.key,
  });

  @override
  State<AddFoodScreen>
      createState() =>
          _AddFoodScreenState();
}

class _AddFoodScreenState
    extends State<AddFoodScreen> {
  final FoodService service =
      FoodService();

  final foodController =
      TextEditingController();

  final servingController =
      TextEditingController();

  final calorieController =
      TextEditingController();

  final proteinController =
      TextEditingController();

  final carbsController =
      TextEditingController();

  final fatController =
      TextEditingController();

  Future<void> saveFood() async {
    await service.addFood(
      foodName:
          foodController.text,
      servingSize:
          servingController.text,
      calories: int.parse(
        calorieController.text,
      ),
      protein: int.parse(
        proteinController.text,
      ),
      carbs: int.parse(
        carbsController.text,
      ),
      fat: int.parse(
        fatController.text,
      ),
    );

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Add Food"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller:
                  foodController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Food Name",
              ),
            ),
            TextField(
              controller:
                  servingController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Serving Size",
              ),
            ),
            TextField(
              controller:
                  calorieController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Calories",
              ),
            ),
            TextField(
              controller:
                  proteinController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Protein",
              ),
            ),
            TextField(
              controller:
                  carbsController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Carbs",
              ),
            ),
            TextField(
              controller:
                  fatController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Fat",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed:
                  saveFood,
              child:
                  const Text(
                "Save Food",
              ),
            ),
          ],
        ),
      ),
    );
  }
}