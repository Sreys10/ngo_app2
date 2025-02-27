import 'package:flutter/material.dart';

class HormonalChangesPage extends StatelessWidget {
  const HormonalChangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('शरीर हार्मोनल बदल'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              // Title section
              const Text(
                'शरीरातील हार्मोनल बदल',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Adrenal Glands Section
              _buildExpandableTopic(
                'अधिवृक्क ग्रंथी - हार्मोन नियमन',
                'अधिवृक्क ग्रंथी हे मूत्रपिंडांच्या वर बसलेले दोन लहान पण शक्तिशाली अवयव आहेत. ते अॅड्रेनालाईन, कॉर्टिसॉल आणि एल्डोस्टेरॉन यासारखे आवश्यक हार्मोन्स तयार करतात, जे चयापचय, रोगप्रतिकारक शक्ती, रक्तदाब आणि तणावाला शरीराची प्रतिक्रिया नियंत्रित करण्यास मदत करतात.\n\n'
                    '**ते काय करतात?**\n'
                    '- **अॅड्रेनालाईन (एपिनेफ्रिन):** "लढा किंवा पळा" हार्मोन जो तणावादरम्यान ऊर्जा वाढवतो आणि हृदयाचे ठोके वाढवतो.\n'
                    '- **कॉर्टिसॉल:** ऊर्जा, रक्तातील साखर आणि रोगप्रतिकारक प्रतिसाद व्यवस्थापित करण्यास मदत करतो, तुम्हाला सक्रिय आणि सतर्क ठेवतो.\n'
                    '- **एल्डोस्टेरॉन:** मीठ आणि पाण्याचे योग्य संतुलन राखतो, स्थिर रक्तदाब सुनिश्चित करतो.\n\n'
                    '**ते किशोरवयीन मुलांसाठी का महत्त्वाचे आहेत?**\n'
                    '✅ शाळा, परीक्षा किंवा सामाजिक जीवनातील तणाव हाताळणे.\n'
                    '✅ खेळ आणि दैनंदिन क्रियांसाठी ऊर्जा वाढवणे.\n'
                    '✅ लैंगिक हार्मोन्सची थोडीशी निर्मिती करून तारुण्यात मदत करणे.\n'
                    '✅ साखर आणि चरबीच्या पातळ्या नियंत्रित करून चयापचय निरोगी ठेवणे.\n\n'
                    '**रोचक तथ्य!**\n'
                    'परीक्षा किंवा मोठ्या कार्यक्रमापूर्वी तुमचे हृदय धडधडले आहे का? ते अॅड्रेनालाईन तुम्हाला सतर्क आणि केंद्रित ठेवण्यासाठी कार्यरत होते!\n\n'
                    '**ते निरोगी कसे ठेवावे?**\n'
                    '💧 हायड्रेटेड राहा – पुरेसे पाणी प्या.\n'
                    '🥗 संतुलित आहार घ्या – जास्त जंक फूड आणि साखर टाळा.\n'
                    '😴 पुरेशी झोप घ्या – रात्री किमान 8 तास.\n'
                    '🏃 नियमित व्यायाम करा – तणाव कमी करण्यास मदत करते.\n'
                    '🧘 आराम करा आणि तणावमुक्त व्हा – ध्यान किंवा छंद तणाव पातळी कमी ठेवू शकतात.',
                'assets/HEALTH/adrenal_gland.jpg',
              ),

              const SizedBox(height: 20),

              // Reproductive Hormones Section
              _buildExpandableTopic(
                'प्रजनन हार्मोन्स (पुरुष आणि महिला)',
                '**पुरुष प्रजनन हार्मोन्स:**\n'
                    'पुरुषांमध्ये, वृषण **टेस्टोस्टेरॉन** तयार करतात, जो प्राथमिक पुरुष लैंगिक हार्मोन आहे. याची महत्त्वाची भूमिका आहे:\n\n'
                    '🔹 पुरुष लैंगिक वैशिष्ट्यांचा विकास (खोल आवाज, चेहरा आणि शरीरावर केस वाढणे).\n'
                    '🔹 स्नायूंची मात्रा आणि हाडांची घनता वाढवणे.\n'
                    '🔹 शुक्राणूंची निर्मिती आणि प्रजननक्षमता.\n'
                    '🔹 लैंगिक इच्छा आणि एकंदरीत प्रजनन आरोग्य नियंत्रित करणे.\n\n'
                    '**पुरुषांमध्ये तारुण्यातील बदल:**\n'
                    '✔ चेहरा, छाती आणि जांघेच्या केसांची वाढ.\n'
                    '✔ आवाज खोल होणे.\n'
                    '✔ उंची आणि स्नायूंची मात्रा वाढणे.\n'
                    '✔ वृषण आणि लिंगाचा आकार वाढणे.\n'
                    '✔ त्वचेत तेल उत्पादन वाढणे (ज्यामुळे मुरुम येऊ शकतात).\n\n'
                    '**महिला प्रजनन हार्मोन्स:**\n'
                    'महिलांमध्ये, अंडाशय **एस्ट्रोजेन** आणि **प्रोजेस्टेरॉन** तयार करतात, जे खालील गोष्टींसाठी मुख्य हार्मोन्स आहेत:\n\n'
                    '🔹 महिला लैंगिक वैशिष्ट्यांचा विकास (स्तनांचा विकास, नितंब रुंद होणे).\n'
                    '🔹 मासिक पाळीचे नियमन.\n'
                    '🔹 गर्भधारणा आणि प्रजनन आरोग्याला आधार देणे.\n'
                    '🔹 हाडांचे आरोग्य आणि भावनिक स्थिरता राखणे.\n\n'
                    '**महिलांमध्ये तारुण्यातील बदल:**\n'
                    '✔ स्तनांची वाढ आणि नितंब रुंद होणे.\n'
                    '✔ मासिक पाळी सुरू होणे (मासिक).\n'
                    '✔ जांघ आणि काखेखालील केसांची वाढ.\n'
                    '✔ नितंब आणि मांड्यांभोवती शरीरातील चरबी वाढणे.\n'
                    '✔ हार्मोनल चढ-उतारांमुळे भावनिक आणि मनःस्थितीतील बदल.\n\n'
                    '**रोचक तथ्य!**\n'
                    'टेस्टोस्टेरॉन महिलांमध्येही कमी प्रमाणात असते, जे स्नायूंची ताकद आणि ऊर्जा पातळींमध्ये मदत करते. त्याचप्रमाणे, पुरुषांमध्येही थोडेसे एस्ट्रोजेन असते, जे हाडांच्या आरोग्यासाठी भूमिका बजावते!',
                'assets/HEALTH/reproductive.jpg',
              ),

              const SizedBox(height: 20),

              // Brain and Hormonal Regulation Section
              _buildExpandableTopic(
                'मेंदू - हार्मोनल नियंत्रण केंद्र',
                'मेंदूतील हायपोथॅलॅमस आणि पिट्यूटरी ग्रंथी हार्मोन्सच्या प्रकाशनाचे नियमन करतात. पुरुष आणि महिलांमध्ये, हे हार्मोन्स वाढ, चयापचय आणि प्रजनन नियंत्रित करतात.\n\n'
                    '1. **तारुण्य आणि किशोरावस्था**\n'
                    '**संबंधित हार्मोन्स:** एस्ट्रोजेन, टेस्टोस्टेरॉन, वाढीचे हार्मोन, कॉर्टिसॉल\n'
                    '**प्रभाव:** डोपामाइनची वाढलेली क्रिया, ज्यामुळे भावना आणि जोखीम घेण्याचे वर्तन वाढते. मज्जातंतूंच्या मार्गांचे मजबुतीकरण, व्यक्तिमत्व आणि निर्णय घेण्यावर प्रभाव टाकते. कॉर्टिसॉल पातळीतील चढ-उतारांमुळे तणावाची संवेदनशीलता वाढते.\n\n'
                    '2. **मासिक पाळी (महिलांमध्ये)**\n'
                    '**संबंधित हार्मोन्स:** एस्ट्रोजेन, प्रोजेस्टेरॉन\n'
                    '**प्रभाव:** एस्ट्रोजेन सेरोटोनिन वाढवते, ज्यामुळे मनःस्थिती आणि संज्ञानात्मक कार्य सुधारते. प्रोजेस्टेरॉनला शांत प्रभाव असतो परंतु यामुळे पीएमएस लक्षणे जसे चिडचिड आणि मनःस्थितीतील बदल होऊ शकतात.\n\n'
                    '3. **गर्भधारणा आणि प्रसूतीनंतर**\n'
                    '**संबंधित हार्मोन्स:** ऑक्सिटोसिन, प्रोलॅक्टिन, एस्ट्रोजेन, प्रोजेस्टेरॉन\n'
                    '**प्रभाव:** ऑक्सिटोसिन बंधन आणि भावनिक जोडणीला प्रोत्साहन देते. उच्च एस्ट्रोजेन आणि प्रोजेस्टेरॉन पातळ्या मनःस्थिती स्थिरतेसाठी योगदान देतात, परंतु प्रसूतीनंतर त्यांच्या अचानक घसरणीमुळे प्रसूतीनंतर उदासीनता येऊ शकते.\n\n'
                    '4. **तणाव प्रतिसाद**\n'
                    '**संबंधित हार्मोन्स:** कॉर्टिसॉल, अॅड्रेनालाईन\n'
                    '**प्रभाव:** अल्पकालिक तणाव लक्ष केंद्रित आणि स्मरणशक्ती वाढवू शकतो. दीर्घकालिक तणावामुळे कॉर्टिसॉलची उच्च पातळी हिप्पोकॅम्पस (स्मरणशक्तीसाठी महत्त्वाचे) लहान करू शकते आणि चिंता आणि उदासीनतेचा धोका वाढवू शकते.\n\n'
                    '5. **वृद्धत्व आणि रजोनिवृत्ती/अँड्रोपॉज**\n'
                    '**संबंधित हार्मोन्स:** एस्ट्रोजेन, टेस्टोस्टेरॉन, DHEA\n'
                    '**प्रभाव:** महिलांमध्ये कमी झालेले एस्ट्रोजेन संज्ञानात्मक घसरण आणि अल्झायमरचा धोका वाढवू शकते. पुरुषांमध्ये कमी टेस्टोस्टेरॉन मनःस्थिती, प्रेरणा आणि स्मरणशक्तीवर परिणाम करू शकते.\n\n'
                    '6. **झोप आणि चक्रवर्ती लय**\n'
                    '**संबंधित हार्मोन्स:** मेलाटोनिन, कॉर्टिसॉल\n'
                    '**प्रभाव:** मेलाटोनिन झोप-जागरण चक्र नियंत्रित करते, संज्ञानात्मक कार्यावर परिणाम करते. या हार्मोन्समधील व्यत्यय (उदा., तणाव किंवा शिफ्ट कामामुळे) स्मरणशक्ती आणि भावनिक नियमनावर परिणाम करू शकतात.\n\n'
                    '7. **मानसिक आरोग्य आणि न्यूरोट्रान्समिटर संनादन**\n'
                    '**हार्मोन्स डोपामाइन, सेरोटोनिन आणि GABA वर प्रभाव टाकतात, जे उदासीनता, चिंता आणि स्किझोफ्रेनिया यासारख्या मनःस्थिती विकारांमध्ये महत्त्वाचे आहेत. हार्मोनल असंतुलन (उदा., थायरॉईड डिसफंक्शन) मेंदूतील धुके, थकवा आणि मनःस्थितीतील बदल यासारखी लक्षणे कारणीभूत ठरू शकतात.**',
                'assets/HEALTH/brain_hormones.jpeg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create an expandable card with an image and explanation
  Widget _buildExpandableTopic(String title, String details, String imagePath) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
