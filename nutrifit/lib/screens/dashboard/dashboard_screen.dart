import 'package:flutter/material.dart';

import '../../services/dashboard_service.dart';

class DashboardScreen
    extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen>
      createState() =>
          _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {
  final DashboardService service =
      DashboardService();

  late Future<Map<String, dynamic>>
      dashboardData;

  @override
  void initState() {
    super.initState();

    dashboardData =
        service.getDashboard();
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          "NutriFit Dashboard",
        ),
      ),
      body: FutureBuilder(
        future:
            dashboardData,
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
                const EdgeInsets.all(
                    16),
            child: Column(
              children: [
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
                      "Consumed Calories",
                    ),
                    trailing: Text(
                      "${data["consumedCalories"]}",
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                      "Remaining Calories",
                    ),
                    trailing: Text(
                      "${data["remainingCalories"]}",
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