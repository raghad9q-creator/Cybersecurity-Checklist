import 'package:flutter/material.dart';

void main() {
  runApp(const CybersecurityApp());
}

class CybersecurityApp extends StatelessWidget {
  const CybersecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cybersecurity Checklist',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF071A2E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF168CFF),
          brightness: Brightness.dark,
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

// ================= WELCOME =================

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0878E8), Color(0xFF06192D)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Cybersecurity Checklist',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Check your security posture',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Review simple security actions and improve your digital safety.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),

                  const SizedBox(height: 45),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SecurityHomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF0878E8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Check My Security',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= TASK MODEL =================

class SecurityTask {
  final String title;
  final String description;
  final String whyImportant;
  final IconData icon;
  bool completed;

  SecurityTask({
    required this.title,
    required this.description,
    required this.whyImportant,
    required this.icon,
    this.completed = false,
  });
}

// ================= HOME PAGE =================

class SecurityHomePage extends StatefulWidget {
  const SecurityHomePage({super.key});

  @override
  State<SecurityHomePage> createState() => _SecurityHomePageState();
}

class _SecurityHomePageState extends State<SecurityHomePage> {
  final List<SecurityTask> accountTasks = [
    SecurityTask(
      title: 'Enable Two-Factor Authentication',
      description: 'Enable MFA on important accounts such as email, banking, and social media.',
      whyImportant: 'MFA adds another layer of protection even if your password is stolen.',
      icon: Icons.verified_user,
    ),
    SecurityTask(
      title: 'Use Strong Passwords',
      description: 'Use long and unique passwords for every important account.',
      whyImportant:
          'Strong and unique passwords reduce the risk of password attacks.',
      icon: Icons.password,
    ),
    SecurityTask(
      title: 'Check Account Recovery Email',
      description:
          'Make sure your recovery email address is correct and secure.',
      whyImportant: 'A secure recovery email helps you recover your account if access is lost.',
      icon: Icons.email,
    ),
  ];

  final List<SecurityTask> deviceTasks = [
    SecurityTask(
      title: 'Update Your Device',
      description: 'Install operating system and application security updates regularly.',
      whyImportant: 'Updates often fix security vulnerabilities that attackers could exploit.',
      icon: Icons.system_update,
    ),
    SecurityTask(
      title: 'Lock Your Device',
      description: 'Use a PIN, password, fingerprint, or face recognition.',
      whyImportant: 'Device locking prevents unauthorized physical access to your information.',
      icon: Icons.lock,
    ),
    SecurityTask(
      title: 'Enable Automatic Updates',
      description: 'Turn on automatic updates whenever possible.',
      whyImportant:
          'Automatic updates help install important security fixes quickly.',
      icon: Icons.update,
    ),
  ];

  final List<SecurityTask> onlineTasks = [
    SecurityTask(
      title: 'Use Secure Websites',
      description: 'Check that websites use HTTPS before entering sensitive information.',
      whyImportant: 'HTTPS helps protect information while it travels between your device and the website.',
      icon: Icons.lock_outline,
    ),
    SecurityTask(
      title: 'Avoid Suspicious Links',
      description:
          'Do not click unknown links in emails, messages, or social media.',
      whyImportant: 'Phishing links can lead to fake websites, malware, or stolen credentials.',
      icon: Icons.link_off,
    ),
    SecurityTask(
      title: 'Be Careful on Public Wi-Fi',
      description:
          'Avoid sensitive activities on unknown or unsecured public networks.',
      whyImportant: 'Untrusted networks can expose your traffic to attackers.',
      icon: Icons.wifi_lock,
    ),
  ];

  int get totalTasks =>
      accountTasks.length + deviceTasks.length + onlineTasks.length;

  int get completedTasks {
    return [
      ...accountTasks,
      ...deviceTasks,
      ...onlineTasks,
    ].where((task) => task.completed).length;
  }

  int get securityScore {
    return ((completedTasks / totalTasks) * 100).round();
  }

  String get scoreMessage {
    if (securityScore < 40) {
      return 'Needs Improvement';
    } else if (securityScore < 70) {
      return 'Good Start';
    } else if (securityScore < 90) {
      return 'Good Security';
    } else {
      return 'Excellent Security';
    }
  }

  Color get scoreColor {
    if (securityScore < 40) {
      return Colors.redAccent;
    } else if (securityScore < 70) {
      return Colors.orangeAccent;
    } else {
      return Colors.greenAccent;
    }
  }

  void toggleTask(SecurityTask task, bool? value) {
    setState(() {
      task.completed = value ?? false;
    });
  }

  void showTaskDetails(SecurityTask task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF102A43),
          title: Row(
            children: [
              Icon(task.icon, color: Colors.lightBlueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What should you do?',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(task.description),

                const SizedBox(height: 20),

                const Text(
                  'Why is it important?',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(task.whyImportant),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget buildTaskCard(SecurityTask task) {
    return Card(
      color: const Color(0xFF12395B),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => showTaskDetails(task),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(task.icon, color: Colors.lightBlueAccent),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: task.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Tap for security explanation',
                      style: TextStyle(fontSize: 11, color: Colors.white54),
                    ),
                  ],
                ),
              ),

              Checkbox(
                value: task.completed,
                onChanged: (value) => toggleTask(task, value),
                activeColor: Colors.greenAccent,
                checkColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(
    String title,
    String subtitle,
    IconData icon,
    List<SecurityTask> tasks,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.lightBlueAccent, size: 23),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 3),

        Padding(
          padding: const EdgeInsets.only(left: 31),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
        ),

        const SizedBox(height: 10),

        ...tasks.map(buildTaskCard),

        const SizedBox(height: 12),
      ],
    );
  }

  Widget buildSecurityTips() {
    const tips = [
      'Use a different password for every important account.',
      'Enable MFA whenever it is available.',
      'Keep your operating system and apps updated.',
      'Think before clicking links in unexpected messages.',
      'Never share passwords or verification codes.',
    ];

    return Card(
      color: const Color(0xFF102F4B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.amberAccent),
                SizedBox(width: 8),
                Text(
                  'Security Tips',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 14),

            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        tip,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScoreCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0878E8), Color(0xFF08A9E8)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Security Score',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            '$securityScore%',
            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                scoreMessage,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: scoreColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: securityScore / 100,
              minHeight: 9,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '$completedTasks of $totalTasks security checks completed',
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0878E8),
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.lock),
            SizedBox(width: 8),
            Text(
              'Cybersecurity Checklist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildScoreCard(),

          const SizedBox(height: 25),

          buildSection(
            'Account Security',
            'Protect your accounts and credentials',
            Icons.account_circle,
            accountTasks,
          ),

          buildSection(
            'Device Security',
            'Protect your phone, computer, and devices',
            Icons.devices,
            deviceTasks,
          ),

          buildSection(
            'Online Security',
            'Stay safe while browsing and using online services',
            Icons.language,
            onlineTasks,
          ),

          const SizedBox(height: 5),

          buildSecurityTips(),

          const SizedBox(height: 30),

          Center(
            child: Text(
              'Cybersecurity Awareness Tool',
              style: TextStyle(
                color: Colors.white.withOpacity(0.35),
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
