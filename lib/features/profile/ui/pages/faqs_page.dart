import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text(
          'Frequently Asked Questions(FAQs)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFaqItem(
              question: "How does the AI-driven resume analysis work?",
              answer:
              "Simply upload your resume, and the app's AI will analyze it against the job postings you're interested in, providing personalized recommendations to enhance your chances of securing an interview.",
              icon: Icons.assignment_ind,
            ),
            const Divider(),
            const SizedBox(height: 10),
            _buildFaqItem(
              question: "How do I reset my password if I forgot it?",
              answer:
              "Go to the login page, click 'Forgot Password,' and enter your registered email address. You'll receive a password reset link. Click on the link and follow the instructions to create a new password.",
              icon: Icons.lock_reset,
            ),
            const Divider(),
            const SizedBox(height: 10),
            _buildFaqItem(
              question: "How do I use the AI to create a tailored cover letter?",
              answer:
              "Copy and paste the job description into the app, and the AI will generate a customized cover letter based on your resume and the job requirements.",
              icon: Icons.edit_note,
            ),
            const Divider(),
            const SizedBox(height: 10),
            _buildFaqItem(
              question: "Can I save my favorite job postings for later?",
              answer:
              "Yes, you can save job postings by tapping the 'Save' button. You can access them anytime from the 'Saved Jobs' section in your dashboard.",
              icon: Icons.bookmark_border,
            ),
            const Divider(),
            const SizedBox(height: 10),
            _buildFaqItem(
              question: "How does Bespoke protect my personal information?",
              answer:
              "We use advanced encryption to ensure your personal data is secure. You can read more about our privacy policy in the 'Settings' under 'Privacy & Security.'",
              icon: Icons.security,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem({
    required String question,
    required String answer,
    required IconData icon,
  }) {
    return ExpansionTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        question,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}


