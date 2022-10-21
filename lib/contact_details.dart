import 'package:flutter/material.dart';
import 'package:untitled/contact_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key, required this.name}) : super(key: key);

  final ContactListModel name;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  Future<void> _makeSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //ph call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.name.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  widget.name.name?.substring(0, 1).toUpperCase() ?? '',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(widget.name.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.name.mobile ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    _makePhoneCall(widget.name.mobile!);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.call),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _makeSms(widget.name.mobile!);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.sms),
                  ),
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.email,
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Share Contact"),
                  ),
                  Divider(height: .5,),
                  ListTile(
                    title: Text("Add to Favorites"),
                  ),
                  Divider(height: .5,),
                  ListTile(
                    title: Text("Add to Blacklist"),
                  ),
                  Divider(height: .5,),
                  ListTile(
                    title: Text("Delete Contact"),
                  ),
                  Divider(height: .5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
