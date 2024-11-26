
import 'package:flutter/material.dart';

import 'contact_us_page.dart';
import 'faqs_page.dart';

class HelpCenterPage extends StatelessWidget {
   HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Help Center',
          style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
            color: Colors.white,
        ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHelpItem('FAQs', 'Find answers to common questions',context),
          _buildDivider(),
          _buildHelpItem('Contact Support', 'Get in touch with us for help', context),
          _buildDivider(),
        ],
      ),
    );
  }

   Widget _buildHelpItem(String title, String subtitle, BuildContext context) {
     return ListTile(
       contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
       title: Text(
         title,
         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
       ),
       subtitle: Text(subtitle),
       trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
       onTap: () {
         _handleHelpItemTap(title, context);
       },
     );
   }

   void _handleHelpItemTap(String title, BuildContext context) {
     if (title == 'FAQs') {
       // Navigate to FAQs page
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => FaqsPage()),
       );
     } else if (title == 'Contact Support') {
       // Navigate to Contact Us page
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => ContactUsPage()),
       );
     }
   }

  // void _handleHelpItemTap(String title) {
  //   // Add navigation or dialog handling for each help section
  //   if (title == 'FAQs') {
  //     // Navigate to FAQ screen or show FAQs
  //   } else if (title == 'Contact Support') {
  //     // Navigate to support form or open email client
  //   }
  // }

  Widget _buildDivider() {
    return Divider(
      height: 1.0,
      color: Colors.grey.shade300,
      thickness: 0.5,
    );
  }

  // // Function to show the feedback dialog
  // Future<void> _showFeedbackDialog(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Send Feedback',
  //           style: TextStyle(
  //               color: Colors.teal,
  //               fontWeight: FontWeight.w500,
  //               fontSize: 18
  //           ),
  //         ),
  //         content: TextField(
  //           controller: _feedbackController,
  //           decoration: const InputDecoration(
  //             hintText: 'Enter your feedback here...',
  //           ),
  //           maxLines: 4,
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Cancel',
  //               style: TextStyle(
  //                   color: Colors.teal,
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 16
  //               ),),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.teal,
  //             ),
  //             child: const Text('Submit',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 16
  //               ),
  //             ),
  //             onPressed: () {
  //               final feedback = _feedbackController.text;
  //               if (feedback.isNotEmpty) {
  //                 // Here, you can send the feedback to a server or save it locally
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   const SnackBar(
  //                     backgroundColor: Colors.teal,
  //                     content: Text('Feedback submitted!',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 16
  //                       ),
  //                     ),
  //                     duration: Duration(seconds: 2),
  //                   ),
  //                 );
  //                 _feedbackController.clear();
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
