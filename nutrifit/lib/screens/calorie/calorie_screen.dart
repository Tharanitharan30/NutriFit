import 'package:flutter/material.dart';
import '../../services/calorie_service.dart';

class CalorieScreen extends StatefulWidget {
  const CalorieScreen({super.key});

  @override
  State<CalorieScreen> createState() =>
      _CalorieScreenState();
}

class _CalorieScreenState
    extends State<CalorieScreen> {
  final CalorieService service =
      CalorieService();

  late Future<Map<String, dynamic>>
      calorieData;

  @override
  void initState() {
    super.initState();
    calorieData =
        service.getCalories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calorie Calculator",
        ),
      ),
      body: FutureBuilder<
          Map<String, dynamic>>(
        future: calorieData,
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final data =
              snapshot.data!;

          return Padding(
            padding:
                const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title:
                        const Text("BMR"),
                    trailing: Text(
                      "${data["bmr"]}",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                      "Maintenance Calories",
                    ),
                    trailing: Text(
                      "${data["maintenanceCalories"]}",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                      "Weight Loss Calories",
                    ),
                    trailing: Text(
                      "${data["weightLossCalories"]}",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                      "Weight Gain Calories",
                    ),
                    trailing: Text(
                      "${data["weightGainCalories"]}",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}