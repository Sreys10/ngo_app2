final List<Map<String, dynamic>> scenarioDataset = [
  {
    "scene_id": "scenario_01",
    "image_url": "assets/PD/scenarios/scenario1.jpg",
    "characters": [
      {
        "name": "आई",
        "emotion_options": ["राग", "दु:ख", "आश्चर्य", "उत्सुकता"],
        "correct_emotion": "राग",
        // "emotion_description": "// आई मुलाच्या खेळणी मागण्यावर नाराज आहेत."
      },
      {
        "name": "मुलगा",
        "emotion_options": ["आनंद", "दु:ख", "उत्सुकता", "आश्चर्य"],
        "correct_emotion": "दु:ख",
        // "emotion_description": " मुलगा आईकडून नकार मिळाल्यावर दु:खी आहे."
      }
    ],
    // "additional_notes": "आई नकार देताना नाराज आहेत, आणि मुलगा दु:खी आहे."
  },
  {
    "scene_id": "scenario_02",
    "image_url": "assets/PD/scenarios/scenario2.jpg", // Updated path
    "characters": [
      {
        "name": "आई",
        "emotion_options": ["आत्मविश्वास", "आनंद", "आश्चर्य", "विचार"],
        "correct_emotion": "विचार",
        // "emotion_description": "// आई विचार करत आहेत की, रात्री जेवणासाठी काय बनवावे."
      },
      {
        "name": "मुलगा",
        "emotion_options": ["राग", "दु:ख", "उत्सुकता", "आश्चर्य"],
        "correct_emotion": "उत्सुकता",
        // "emotion_description": "// मुलगा उत्साहित होऊन पावभाजी बनवण्याची सूचना देत आहे."
      }
    ],
    // "additional_notes": "आई विचार करत आहेत की, रात्रीच्या जेवणासाठी काय बनवावे, आणि मुलगा उत्साही होऊन पावभाजी सुचवतो."
  },
  {
    "scene_id": "scenario_03",
    "image_url": "assets/PD/scenarios/scenario3.jpg", // Updated path
    "characters": [
      {
        "name": "मित्र",
        "emotion_options": ["उत्सुकता", "दु:ख", "आनंद", "आश्चर्य"],
        "correct_emotion": "आनंद",
        // "emotion_description": "// मित्र आनंदाने दुसऱ्या मित्राला वाढदिवसाच्या शुभेच्छा देत आहे."
      },
      {
        "name": "वाढदिवस मुलगा",
        "emotion_options": ["लाज", "आश्चर्य", "उत्सुकता", "आनंद"],
        "correct_emotion": "आनंद",
        // "emotion_description": "// वाढदिवसाचा मित्र शुभेच्छा ऐकून आनंदी आहे."
      }
    ],
    // "additional_notes": "दोन्ही मित्र आनंदी आहेत, एक वाढदिवसाच्या शुभेच्छा देत आहे आणि दुसरा आनंदाने त्या शुभेच्छांना प्रतिसाद देतो."
  },
  {
    "scene_id": "scenario_04",
    "image_url": "assets/PD/scenarios/scenario4.jpg", // Updated path
    "characters": [
      {
        "name": "पहिला मुलगा",
        "emotion_options": ["आत्मविश्वास", "दु:ख", "राग", "उत्सुकता"],
        "correct_emotion": "राग",
        // "emotion_description": "// पहिला मुलगा दुसऱ्या मुलाशी रागाने भांडत आहे."
      },
      {
        "name": "दुसरा मुलगा",
        "emotion_options": ["उत्सुकता", "दु:ख", "आत्मविश्वास", "भीती"],
        "correct_emotion": "भीती",
        // "emotion_description": "// दुसरा मुलगा देखील रागाने पहिल्या मुलाशी भांडत आहे."
      }
    ],
    // "additional_notes": "दोन्ही मुलं रागाने भांडत आहेत, एकमेकांवर नाराज आहेत."
  },
  {
    "scene_id": "scenario_05",
    "image_url": "assets/PD/scenarios/scenario5.jpg", // Updated path
    "characters": [
      {
        "name": "शिक्षक",
        "emotion_options": ["आनंद", "आश्चर्य", "आत्मविश्वास", "दु:ख"],
        "correct_emotion": "आश्चर्य",
        // "emotion_description": "// शिक्षक विद्यार्थ्यांच्या सुंदर चित्रांना पाहून आश्चर्यचकित झाले आहेत."
      },
      {
        "name": "विद्यार्थी",
        "emotion_options": ["लाज", "उत्सुकता", "आनंद", "दु:ख"],
        "correct_emotion": "उत्सुकता",
        // "emotion_description": "// विद्यार्थी त्यांच्या चित्रांना दाखवण्यास उत्साही आहेत."
      }
    ],
    // "additional_notes": "शिक्षक विद्यार्थ्यांच्या चित्रांना पाहून आश्चर्यचकित आहेत, आणि विद्यार्थी त्यांना दाखवण्यासाठी खूप उत्साही आहेत."
  },
  {
    "scene_id": "scenario_06",
    "image_url": "assets/PD/scenarios/scenario6.jpg", // Updated path
    "characters": [
      {
        "name": "शिक्षक",
        "emotion_options": ["उत्सुकता", "दु:ख", "आनंद", "आश्चर्य"],
        "correct_emotion": "आनंद",
        // "emotion_description": "// शिक्षक एका मुलीने उत्तर द्यायला तयार असल्यामुळे आनंदित आहेत."
      },
      {
        "name": "उत्तर देणारी मुलगी",
        "emotion_options": ["लाज", "आत्मविश्वास", "उत्सुकता", "आनंद"],
        "correct_emotion": "आत्मविश्वास",
        // "emotion_description": "// ही मुलगी आत्मविश्वासाने शिक्षकांच्या प्रश्नाचे उत्तर द्यायला तयार आहे."
      },
      {
        "name": "इतर मुलगी",
        "emotion_options": ["राग", "आनंद", "दु:ख", "मत्सर"],
        "correct_emotion": "मत्सर",
        // "emotion_description": "// ही मुलगी दुसऱ्या मुलीच्या आत्मविश्वासामुळे असूयेने ग्रासली आहे."
      }
    ],
    // "additional_notes": "शिक्षक आनंदी आहेत, उत्तर देणारी मुलगी आत्मविश्वासाने भरलेली आहे, आणि इतर मुलगी असूया व्यक्त करत आहे."
  },
  {
    "scene_id": "scenario_07",
    "image_url": "assets/PD/scenarios/scenario7.jpg", // Updated path
    "characters": [
      {
        "name": "आई",
        "emotion_options": ["उत्सुकता", "आनंद", "आत्मविश्वास", "कुतूहल"],
        "correct_emotion": "कुतूहल",
        // "emotion_description": "// आई सुंदर ड्रेसची किंमत जाणून घेण्यासाठी उत्सुक आहेत."
      },
      {
        "name": "मुलगी",
        "emotion_options": ["आत्मविश्वास", "उत्सुकता", "लाज", "आनंद"],
        "correct_emotion": "उत्सुकता",
        // "emotion_description": "// मुलगी सुंदर ड्रेस पाहून खूप उत्साही आहे."
      }
    ],
    // "additional_notes": "मुलगी सुंदर ड्रेस पाहून आनंदित आणि उत्साही आहे, तर आई ड्रेसच्या किमतीबद्दल जाणून घेण्यासाठी उत्सुक आहेत."
  },
  {
    "scene_id": "scenario_08",
    "image_url": "assets/PD/scenarios/scenario8.jpg", // Updated path
    "characters": [
      {
        "name": "आई",
        "emotion_options": ["दु:ख", "राग", "आश्चर्य", "आत्मविश्वास"],
        "correct_emotion": "राग",
        // "emotion_description": "// आई मुलाने फूलदाणी तोडल्यामुळे खूप नाराज आहेत."
      },
      {
        "name": "मुलगा",
        "emotion_options": ["दु:ख", "पश्चात्ताप", "आत्मविश्वास", "आनंद"],
        "correct_emotion": "पश्चात्ताप",
        // "emotion_description": "// मुलगा फूलदाणी तोडल्यामुळे स्वतःला दोषी समजत आहे."
      }
    ],
    // "additional_notes": "आई खूप नाराज आहेत, आणि मुलगा त्याच्या चुकीसाठी स्वतःला दोषी समजतो."
  },
  {
    "scene_id": "scenario_09",
    "image_url": "assets/PD/scenarios/scenario9.jpg", // Updated path
    "characters": [
      {
        "name": "पालक",
        "emotion_options": ["आनंद", "राग", "दु:ख", "आत्मविश्वास"],
        "correct_emotion": "राग",
        // "emotion_description": "// पालक एकमेकांवर रागावले आहेत."
      },
      {
        "name": "मुलगी",
        "emotion_options": ["एकटेपणा", "दु:ख", "त्रास", "आत्मविश्वास"],
        "correct_emotion": "त्रास",
        // "emotion_description": "// मुलगी पालकांच्या भांडणामुळे त्रासलेली आहे."
      }
    ],
    // "additional_notes": "पालक एकमेकांवर रागावले आहेत, आणि मुलगी त्यांच्या भांडणामुळे त्रस्त आणि निराश झाली आहे."
  },
  {
    "scene_id": "scenario_10",
    "image_url": "assets/PD/scenarios/scenario10.jpg", // Updated path
    "characters": [
      {
        "name": "खेळणारे मुले",
        "emotion_options": ["उत्सुकता", "आनंद", "थकवा", "आत्मविश्वास"],
        "correct_emotion": "आनंद",
        // "emotion_description": "// खेळणारे मुले पार्कमध्ये मजा करत आहेत आणि खूप आनंदी आहेत."
      },
      {
        "name": "एकटा बसलेला मुलगा",
        "emotion_options": ["आनंद", "दु:ख", "त्रास", "एकटेपणा"],
        "correct_emotion": "एकटेपणा",
        // "emotion_description": "// एकटा मुलगा खेळण्यात सामील नाही आणि स्वतःला एकटा वाटत आहे."
      }
    ],
    // "additional_notes": "खेळणाऱ्या मुलांचा आनंद आणि एकट्या मुलाची निराशा यामध्ये विरोधाभास आहे."
  }
];
