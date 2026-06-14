import 'package:flutter/material.dart';
import '../../services/meal_service.dart';

class DailySummaryScreen
    extends StatefulWidget {
  const DailySummaryScreen({
    super.key,
  });

  @override
  State<DailySummaryScreen>
      createState() =>
          _DailySummaryScreenState();
}

class _DailySummaryScreenState
    extends State<DailySummaryScreen> {
  final MealService service =
      MealService();

  late Future<Map<String, dynamic>>
      summary;

  @override
  void initState() {
    super.initState();

    summary =
        service.getSummary();
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Nutrition",
        ),
      ),
      body: FutureBuilder(
        future: summary,
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
                        const Text(
                      "Calories",
                    ),
                    trailing:
                        Text(
                      "${data["totalCalories"]}",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title:
                        const Text(
                      "Protein",
                    ),
                    trailing:
                        Text(
                      "${data["totalProtein"]} g",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title:
                        const Text(
                      "Carbs",
                    ),
                    trailing:
                        Text(
                      "${data["totalCarbs"]} g",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title:
                        const Text(
                      "Fat",
                    ),
                    trailing:
                        Text(
                      "${data["totalFat"]} g",
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