import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Send details to admin",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    labelText: 'Email Subject',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    labelText: 'Email Body',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  sendEmailWithSubjectAndBody(
                    subjectController.text,
                    bodyController.text,
                  );
                },
                child: Text('Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch the email client with subject and body text
  sendEmailWithSubjectAndBody(String subject, String body) async {
    final recipientEmail = 'shresthaasaugat31@gmail.com';
    final email =
        'mailto:$recipientEmail?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch email';
    }
  }
}
