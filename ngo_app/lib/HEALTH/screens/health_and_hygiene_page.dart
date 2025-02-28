import 'package:flutter/material.dart';

class HealthAndHygienePage extends StatelessWidget {
  const HealthAndHygienePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('आरोग्य आणि स्वच्छता - फायदे आणि तोटे'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.green.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'आरोग्य आणि स्वच्छतेचे फायदे',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Pros Section with Expandable Details
              _buildExpandableTopic('रोगप्रतिकार शक्ती वाढवते',
                  'योग्य स्वच्छता राखल्याने आपण हानिकारक रोगजंतूंच्या प्रवेशाला प्रतिबंध करतो. यामुळे आपली रोगप्रतिकार शक्ती मजबूत राहते आणि रोगांशी लढण्यास अधिक सक्षम बनते.'),
              _buildExpandableTopic('रोगांचा प्रतिबंध करते',
                  'हात धुणे आणि परिसर स्वच्छ ठेवणे यासारख्या चांगल्या स्वच्छता पद्धतींमुळे संसर्ग आणि रोगांचा धोका मोठ्या प्रमाणात कमी होतो.'),

              const SizedBox(height: 20),
              const Text(
                'आरोग्य आणि स्वच्छतेचे तोटे',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Cons Section with Expandable Details
              _buildExpandableTopic('स्वच्छता उत्पादनांचा अतिवापर',
                  'अँटीबॅक्टेरियल साबण आणि सॅनिटायझरचा जास्त वापर आपल्या त्वचेवरील नैसर्गिक जीवाणूंच्या संतुलनाला बाधा आणू शकतो, ज्यामुळे कोरडी त्वचा आणि प्रतिजैविक प्रतिकार यासारख्या समस्या उद्भवू शकतात.'),
              _buildExpandableTopic('मानसिक ताण',
                  'काहीवेळा, अति स्वच्छतेची सवय चिंता किंवा ऑब्सेसिव्ह-कंपल्सिव्ह डिसऑर्डर (OCD) ला कारणीभूत ठरू शकते, ज्यामुळे व्यक्तींवर मानसिक ताण येऊ शकतो.'),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create an expandable card for pros and cons
  Widget _buildExpandableTopic(String title, String details) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white.withOpacity(0.8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              details,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
