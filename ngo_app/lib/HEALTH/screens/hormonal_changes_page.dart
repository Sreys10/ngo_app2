import 'package:flutter/material.dart';

class HormonalChangesPage extends StatelessWidget {
  const HormonalChangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Hormonal Changes'),
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
                'Hormonal Changes in the Body',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Adrenal Glands Section
              _buildExpandableTopic(
                'Adrenal Glands - Hormonal Regulation',
                'The adrenal glands are two small but powerful organs sitting on top of the kidneys. They produce essential hormones like adrenaline, cortisol, and aldosterone, which help regulate metabolism, the immune system, blood pressure, and the body’s response to stress.\n\n'
                    '**What Do They Do?**\n'
                    '- **Adrenaline (Epinephrine):** The "fight or flight" hormone that boosts energy and increases heart rate during stress.\n'
                    '- **Cortisol:** Helps manage energy, blood sugar, and immune response, keeping you active and alert.\n'
                    '- **Aldosterone:** Maintains the right balance of salt and water, ensuring stable blood pressure.\n\n'
                    '**Why Are They Important for Teens?**\n'
                    '✅ Handling stress from school, exams, or social life.\n'
                    '✅ Boosting energy for sports and daily activities.\n'
                    '✅ Helping with puberty by producing small amounts of sex hormones.\n'
                    '✅ Keeping metabolism healthy by regulating sugar and fat levels.\n\n'
                    '**Fun Fact!**\n'
                    'Ever felt your heart race before an exam or a big event? That’s adrenaline kicking in to help you stay alert and focused!\n\n'
                    '**How to Keep Them Healthy?**\n'
                    '💧 Stay hydrated – Drink enough water.\n'
                    '🥗 Eat a balanced diet – Avoid too much junk food and sugar.\n'
                    '😴 Get enough sleep – At least 8 hours per night.\n'
                    '🏃 Exercise regularly – Helps reduce stress.\n'
                    '🧘 Relax and unwind – Meditation or hobbies can keep stress levels low.',
                'assets/HEALTH/adrenal_gland.jpg',
              ),

              const SizedBox(height: 20),

              // Reproductive Hormones Section
              _buildExpandableTopic(
                'Reproductive Hormones (Male & Female)',
                '**Male Reproductive Hormones:**\n'
                    'In males, the testicles produce **testosterone**, the primary male sex hormone. It plays a vital role in:\n\n'
                    '🔹 Development of male sexual characteristics (deeper voice, facial and body hair growth).\n'
                    '🔹 Increase in muscle mass and bone density.\n'
                    '🔹 Sperm production and fertility.\n'
                    '🔹 Regulation of sex drive and overall reproductive health.\n\n'
                    '**Changes During Puberty in Males:**\n'
                    '✔ Growth of facial, chest, and pubic hair.\n'
                    '✔ Deepening of the voice.\n'
                    '✔ Increase in height and muscle mass.\n'
                    '✔ Enlargement of the testicles and penis.\n'
                    '✔ Increased oil production in the skin (which may lead to acne).\n\n'
                    '**Female Reproductive Hormones:**\n'
                    'In females, the ovaries produce **estrogen** and **progesterone**, the key hormones responsible for:\n\n'
                    '🔹 Development of female sexual characteristics (breast development, widening of hips).\n'
                    '🔹 Regulation of the menstrual cycle.\n'
                    '🔹 Supporting pregnancy and reproductive health.\n'
                    '🔹 Maintaining bone health and emotional stability.\n\n'
                    '**Changes During Puberty in Females:**\n'
                    '✔ Growth of breasts and widening of hips.\n'
                    '✔ Start of the menstrual cycle (periods).\n'
                    '✔ Growth of pubic and underarm hair.\n'
                    '✔ Increase in body fat, especially around the hips and thighs.\n'
                    '✔ Emotional and mood changes due to hormonal fluctuations.\n\n'
                    '**Fun Fact!**\n'
                    'Testosterone is also present in females in small amounts, helping with muscle strength and energy levels. Similarly, males also have a small amount of estrogen, which plays a role in bone health!',
                'assets/HEALTH/reproductive.jpg',
              ),

              const SizedBox(height: 20),

              // Brain and Hormonal Regulation Section
              _buildExpandableTopic(
                'Brain - The Hormonal Command Center',
                'The hypothalamus and pituitary gland in the brain regulate the release of hormones. In both males and females, these hormones control growth, metabolism, and reproduction.\n\n'
                        '1. **Puberty and Adolescence**\n' +
                    '**Hormones involved:** Estrogen, Testosterone, Growth Hormone, Cortisol\n' +
                    '**Effects:** Increased dopamine activity, leading to heightened emotions and risk-taking behavior. Strengthening of neural pathways, influencing personality and decision-making. Increased sensitivity to stress due to fluctuating cortisol levels.\n\n' +
                    '2. **Menstrual Cycle (in Women)**\n' +
                    '**Hormones involved:** Estrogen, Progesterone\n' +
                    '**Effects:** Estrogen boosts serotonin, improving mood and cognitive function. Progesterone has calming effects but may also contribute to PMS symptoms like irritability and mood swings.\n\n' +
                    '3. **Pregnancy and Postpartum**\n' +
                    '**Hormones involved:** Oxytocin, Prolactin, Estrogen, Progesterone\n' +
                    '**Effects:** Oxytocin promotes bonding and emotional connection. High estrogen and progesterone levels contribute to mood stability, but their sudden drop after childbirth can lead to postpartum depression.\n\n' +
                    '4. **Stress Response**\n' +
                    '**Hormones involved:** Cortisol, Adrenaline\n' +
                    '**Effects:** Short-term stress can enhance focus and memory. Chronic stress leads to high cortisol levels, which may shrink the hippocampus (important for memory) and increase anxiety and depression risks.\n\n' +
                    '5. **Aging and Menopause/Andropause**\n' +
                    '**Hormones involved:** Estrogen, Testosterone, DHEA\n' +
                    '**Effects:** Decreased estrogen in women can lead to cognitive decline and increased risk of Alzheimers. Lower testosterone in men can affect mood, motivation, and memory.\n\n' +
                    '6. **Sleep and Circadian Rhythms**\n' +
                    '**Hormones involved:** Melatonin, Cortisol\n' +
                    '**Effects:** Melatonin regulates sleep-wake cycles, affecting cognitive function. Disruptions in these hormones (e.g., due to stress or shift work) can impair memory and emotional regulation.\n\n' +
                    '7. **Mental Health and Neurotransmitter Interaction**\n' +
                    '**Hormones influence dopamine, serotonin, and GABA, which are key in mood disorders like depression, anxiety, and schizophrenia. Hormonal imbalances (e.g., thyroid dysfunction) can cause symptoms like brain fog, fatigue, and mood disturbances.**',
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
