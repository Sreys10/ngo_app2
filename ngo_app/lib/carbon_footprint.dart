import 'package:flutter/material.dart';

class CarbonFootprintPage extends StatelessWidget {
  const CarbonFootprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController distanceController = TextEditingController();
    final TextEditingController electricityController = TextEditingController();
    final TextEditingController wasteController = TextEditingController();
    final TextEditingController waterController = TextEditingController();

    String selectedTransport = 'Car'; // Default transport mode
    String selectedDiet = 'Omnivore'; // Default diet

    final transportEmissions = {
      'Car': 0.21,
      'Bus': 0.05,
      'Bike': 0.00,
      'Train': 0.06,
      'Airplane': 0.25,
    };

    final dietEmissions = {
      'Vegan': 2.0,
      'Vegetarian': 3.0,
      'Omnivore': 5.0,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Footprint Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Travel Distance (in km):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E.g., 100',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mode of Transport:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedTransport,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedTransport = newValue;
                }
              },
              items: transportEmissions.keys.map((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Electricity Usage (in kWh):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: electricityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E.g., 200',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Waste Generated (in kg per week):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: wasteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E.g., 5',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dietary Habits:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedDiet,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedDiet = newValue;
                }
              },
              items: dietEmissions.keys.map((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Water Usage (in liters per day):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: waterController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E.g., 100',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final double distance =
                    double.tryParse(distanceController.text) ?? 0.0;
                final double electricity =
                    double.tryParse(electricityController.text) ?? 0.0;
                final double waste =
                    double.tryParse(wasteController.text) ?? 0.0;
                final double water =
                    double.tryParse(waterController.text) ?? 0.0;

                final double transportFootprint =
                    distance * transportEmissions[selectedTransport]!;
                final double electricityFootprint =
                    electricity * 0.5; // Example
                final double wasteFootprint = waste * 2.0; // Example
                final double dietFootprint = dietEmissions[selectedDiet]!;
                final double waterFootprint = water * 0.01; // Example

                final double totalFootprint = transportFootprint +
                    electricityFootprint +
                    wasteFootprint +
                    dietFootprint +
                    waterFootprint;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Carbon Footprint'),
                    content: Text(
                      'Your estimated total carbon footprint is ${totalFootprint.toStringAsFixed(2)} kg CO2.\n\n'
                      'Details:\n'
                      'Transport: ${transportFootprint.toStringAsFixed(2)} kg CO2\n'
                      'Electricity: ${electricityFootprint.toStringAsFixed(2)} kg CO2\n'
                      'Waste: ${wasteFootprint.toStringAsFixed(2)} kg CO2\n'
                      'Diet: ${dietFootprint.toStringAsFixed(2)} kg CO2\n'
                      'Water: ${waterFootprint.toStringAsFixed(2)} kg CO2',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
