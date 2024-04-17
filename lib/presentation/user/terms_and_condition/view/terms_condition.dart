
import 'package:ev_project/presentation/user/profile/view/profile.dart';
import 'package:flutter/material.dart';
class Terms_Conditions extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
        leading: Icon(Icons.list_alt_outlined),
        backgroundColor: Colors.white,
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  """1. Introduction

Welcome to Ev Charging! This Privacy Policy outlines our practices regarding the collection, use, and disclosure of information that we may collect through our EV charging app. By using our app, you agree to the terms outlined in this policy.

2. Information We Collect

a. User-Provided Information:

When you create an account, we may collect personal information such as your name, email address, and payment information.
If you choose to enable location services, we may collect your geolocation data to provide you with relevant charging station information.
b. Automatically Collected Information:

We may collect information about your device, including device type, operating system, and unique device identifiers.
We may collect usage data, including app interactions, charging history, and error logs.
3. How We Use Your Information

a. Providing Services:

We use the information collected to provide you with the services offered by our app, including locating charging stations, processing payments, and facilitating charging sessions.
b. Improving User Experience:

We may use information to analyze user behavior, troubleshoot issues, and enhance the overall user experience.
c. Communication:

We may use your contact information to send you important updates, notifications, and marketing communications related to our services. You can opt out of marketing communications at any time.
4. Data Security

We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the internet or electronic storage is 100% secure.

5. Sharing of Information

We may share your information with third parties in the following circumstances:

With your consent.
To comply with legal obligations.
To protect our rights or the safety of others.
In connection with a merger, acquisition, or sale of assets.
6. Your Choices

You can control the collection and use of certain information through your app settings. You may also choose to delete your account at any time, which will result in the removal of your personal information.

7. Changes to This Privacy Policy

We may update this Privacy Policy from time to time. We will notify you of any significant changes through the app or other means.

8. Contact Us

If you have any questions or concerns about this Privacy Policy, please contact us at [contact@email.com].

""",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.of(context).pop(Profile());

                    },
                    child: Text('Accept'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(Profile());
                    },
                    child: Text('Decline'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
