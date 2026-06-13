import 'package:flutter/material.dart';
import '../../services/profile_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileService profileService = ProfileService();

  final TextEditingController ageController =
      TextEditingController();

  final TextEditingController heightController =
      TextEditingController();

  final TextEditingController weightController =
      TextEditingController();

  String gender = "male";
  String activityLevel = "moderate";

  bool isLoading = false;

  Future<void> saveProfile() async {
    try {
      setState(() {
        isLoading = true;
      });

      await profileService.updateProfile(
        age: int.parse(ageController.text),
        gender: gender,
        height: double.parse(heightController.text),
        weight: double.parse(weightController.text),
        activityLevel: activityLevel,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile Saved Successfully"),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    } finally {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NutriFit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height (cm)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              initialValue: gender,
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "male",
                  child: Text("Male"),
                ),
                DropdownMenuItem(
                  value: "female",
                  child: Text("Female"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              initialValue: activityLevel,
              decoration: const InputDecoration(
                labelText: "Activity Level",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "sedentary",
                  child: Text("Sedentary"),
                ),
                DropdownMenuItem(
                  value: "light",
                  child: Text("Light"),
                ),
                DropdownMenuItem(
                  value: "moderate",
                  child: Text("Moderate"),
                ),
                DropdownMenuItem(
                  value: "active",
                  child: Text("Active"),
                ),
                DropdownMenuItem(
                  value: "very_active",
                  child: Text("Very Active"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  activityLevel = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : saveProfile,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Save Profile",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}