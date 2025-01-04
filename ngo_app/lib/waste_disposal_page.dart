import 'package:flutter/material.dart';

class WasteDisposalPage extends StatelessWidget {
  const WasteDisposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Get screen width
    double height = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      appBar: AppBar(
        title: const Text('4.4 Waste Disposal'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(
            width * 0.05), // Dynamic padding based on screen width
        child: SingleChildScrollView(
          // Ensures content is scrollable on smaller screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Application:',
                style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold), // Scalable text size
              ),
              Text(
                'A waste segregation game using augmented reality (AR)...',
                style: TextStyle(fontSize: width * 0.04),
              ),
              SizedBox(height: height * 0.02), // Dynamic spacing
              Text(
                'Activity:',
                style: TextStyle(
                    fontSize: width * 0.06, fontWeight: FontWeight.bold),
              ),
              Text(
                'Conduct online workshops on composting and e-waste management...',
                style: TextStyle(fontSize: width * 0.04),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Waste Disposal Game (AR-based):',
                style: TextStyle(
                    fontSize: width * 0.06, fontWeight: FontWeight.bold),
              ),
              Text(
                'The AR game provides a fun and interactive way...',
                style: TextStyle(fontSize: width * 0.04),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Show AR game or placeholder
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('AR Game coming soon!')),
                  );
                },
                child: const Text('Launch AR Waste Disposal Game'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.1),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Additional Resources for Waste Disposal:',
                style: TextStyle(
                    fontSize: width * 0.06, fontWeight: FontWeight.bold),
              ),
              Text(
                '1. Guide on composting at home\n'
                '2. E-waste management and recycling\n'
                '3. How to properly dispose of hazardous waste\n'
                '4. Local recycling centers and their rules\n'
                '5. Sustainable alternatives to reduce waste',
                style: TextStyle(fontSize: width * 0.04),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
