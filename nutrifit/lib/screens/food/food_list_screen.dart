import 'package:flutter/material.dart';

import '../../services/food_service.dart';
import 'add_food_screen.dart';

class FoodListScreen
    extends StatefulWidget {
  const FoodListScreen({
    super.key,
  });

  @override
  State<FoodListScreen>
      createState() =>
          _FoodListScreenState();
}

class _FoodListScreenState
    extends State<FoodListScreen> {
  final FoodService service =
      FoodService();

  late Future<List<dynamic>>
      foods;

  @override
  void initState() {
    super.initState();

    foods =
        service.getFoods();
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          "Food List",
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddFoodScreen(),
            ),
          );
        },
        child:
            const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: foods,
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot
                  .connectionState ==
              ConnectionState
                  .waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot
              .hasError) {
            return Center(
              child: Text(
                snapshot.error
                    .toString(),
              ),
            );
          }

          final foodList =
              snapshot.data!;

          return ListView.builder(
            itemCount:
                foodList.length,
            itemBuilder:
                (context, index) {
              final food =
                  foodList[index];

              return Card(
                child: ListTile(
                  title: Text(
                    food["foodName"],
                  ),
                  subtitle: Text(
                    "${food["calories"]} Calories",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}