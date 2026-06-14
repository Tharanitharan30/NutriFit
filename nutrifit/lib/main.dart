import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/calorie/calorie_screen.dart';
import 'screens/food/food_list_screen.dart';
import 'screens/food/add_food_screen.dart';
import 'screens/meal/daily_summary_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const NutriFitApp());
}

class NutriFitApp extends StatelessWidget {
  const NutriFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriFit',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const TestMenuScreen(),
    );
  }
}

class TestMenuScreen extends StatelessWidget {
  const TestMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NutriFit Test Menu"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuButton(
            context,
            "Login Screen",
            const LoginScreen(),
          ),

          _menuButton(
            context,
            "Register Screen",
            const RegisterScreen(),
          ),

          _menuButton(
            context,
            "Profile Screen",
            const ProfileScreen(),
          ),

          _menuButton(
            context,
            "Calorie Calculator",
            const CalorieScreen(),
          ),

          _menuButton(
            context,
            "Food List",
            const FoodListScreen(),
          ),

          _menuButton(
            context,
            "Add Food",
            const AddFoodScreen(),
          ),

          _menuButton(
            context,
            "Daily Summary",
            const DailySummaryScreen(),
          ),

          _menuButton(
            context,
            "Dashboard",
            const DashboardScreen(),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    String title,
    Widget screen,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => screen,
              ),
            );
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}