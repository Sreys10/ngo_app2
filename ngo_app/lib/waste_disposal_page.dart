import 'package:flutter/material.dart';

class WasteDisposalPage extends StatelessWidget {
  const WasteDisposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4.4 Waste Disposal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Application:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('A waste segregation game using augmented reality (AR).'),
            const SizedBox(height: 10),
            const Text(
              'Activity:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Conduct online workshops on composting and e-waste management, including videos on handling wet and dry waste, and topics like sanitary pad disposal for girls.'),
          ],
        ),
      ),
    );
  }
}
