import 'package:flutter/material.dart';
import 'organize_challenge_page.dart';

class CarbonFootprintPage extends StatefulWidget {
  const CarbonFootprintPage({super.key});

  @override
  _CarbonFootprintPageState createState() => _CarbonFootprintPageState();
}

class _CarbonFootprintPageState extends State<CarbonFootprintPage> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController bulbsController = TextEditingController();
  final TextEditingController tvController = TextEditingController();
  final TextEditingController acController = TextEditingController();
  final TextEditingController fridgeController = TextEditingController();
  final TextEditingController wasteController = TextEditingController();
  final TextEditingController waterController = TextEditingController();

  String selectedTransport = 'कार'; // Default transport mode
  String selectedDiet = 'सर्वभक्षी'; // Default diet

  final transportEmissions = {
    'कार': 0.21,
    'बस': 0.05,
    'सायकल': 0.00,
    'रेल्वे': 0.06,
    'विमान': 0.25,
  };

  final dietEmissions = {
    'शाकाहारी': 2.0,
    'वनस्पती आहार': 3.0,
    'सर्वभक्षी': 5.0,
  };

  // Power consumption in watts for common appliances
  final double bulbPower = 10; // 10 watts per bulb
  final double tvPower = 100; // 100 watts for TV
  final double acPower = 1500; // 1500 watts for AC
  final double fridgePower = 200; // 200 watts for fridge

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('कार्बन फूटप्रिंट कॅल्क्युलेटर'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'प्रवास अंतर (किमी मध्ये):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 100',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'वाहतुकीचे साधन:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedTransport,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedTransport = newValue;
                  });
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
              'वीज वापर:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'दिवे (संख्या आणि तास):',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              controller: bulbsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 5 दिवे, 4 तास',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'टीव्ही (तास):',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              controller: tvController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 3 तास',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'एअर कंडिशनर (तास):',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              controller: acController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 8 तास',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'फ्रिज (तास):',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              controller: fridgeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 24 तास',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'कचरा निर्मिती (आठवड्यातील किलो मध्ये):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: wasteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 5',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'आहार पद्धती:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedDiet,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedDiet = newValue;
                  });
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
              'पाणी वापर (लीटर प्रति दिवस):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: waterController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'उदा., 100',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final double distance =
                    double.tryParse(distanceController.text) ?? 0.0;
                final int bulbs = int.tryParse(bulbsController.text) ?? 0;
                final double tvHours =
                    double.tryParse(tvController.text) ?? 0.0;
                final double acHours =
                    double.tryParse(acController.text) ?? 0.0;
                final double fridgeHours =
                    double.tryParse(fridgeController.text) ?? 0.0;
                final double waste =
                    double.tryParse(wasteController.text) ?? 0.0;
                final double water =
                    double.tryParse(waterController.text) ?? 0.0;

                // Calculate electricity consumption in kWh
                final double electricityFootprint = (bulbs *
                        bulbPower *
                        4 /
                        1000) + // Assuming 4 hours per bulb
                    (tvHours * tvPower / 1000) +
                    (acHours * acPower / 1000) +
                    (fridgeHours * fridgePower / 1000);

                final double transportFootprint =
                    distance * transportEmissions[selectedTransport]!;
                final double wasteFootprint = waste * 2.0;
                final double dietFootprint = dietEmissions[selectedDiet]!;
                final double waterFootprint = water * 0.01;

                final double totalFootprint = transportFootprint +
                    electricityFootprint +
                    wasteFootprint +
                    dietFootprint +
                    waterFootprint;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('कार्बन फूटप्रिंट'),
                    content: Text(
                      'तुमचा अंदाजे एकूण कार्बन फूटप्रिंट ${totalFootprint.toStringAsFixed(2)} किलो CO2 आहे.\n\n'
                      'तपशील:\n'
                      'वाहतूक: ${transportFootprint.toStringAsFixed(2)} किलो CO2\n'
                      'वीज: ${electricityFootprint.toStringAsFixed(2)} किलो CO2\n'
                      'कचरा: ${wasteFootprint.toStringAsFixed(2)} किलो CO2\n'
                      'आहार: ${dietFootprint.toStringAsFixed(2)} किलो CO2\n'
                      'पाणी: ${waterFootprint.toStringAsFixed(2)} किलो CO2',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('ठीक आहे'),
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
                'गणना करा',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrganizeChallengePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'आव्हान आयोजित करा',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
