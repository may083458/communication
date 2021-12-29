import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailPage extends StatefulWidget {
  @override
  _MailPageState createState() =>   _MailPageState();
}

class _MailPageState extends State<MailPage> {
  final _controllerTo = TextEditingController();
  final _controllerSubject = TextEditingController();
  final _controllerMessage = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _sentEmail() {
    _launch('mailto:mphyu037@gmail.com');
  }

  void _launch(String urlString) async{
    print(urlString);
    if (await canLaunch(urlString)) {
      await launch(urlString);
    }else{
      throw 'Could not lunch url';
    }
  }
  void _launchEmail(String toEmail,
  String subject,
  String message) async {
    final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    _launch(url);
  }


  Widget build(BuildContext context) {

    return   Scaffold(
      // appBar:   AppBar(
      //   title:   Text('Mail'),
      // ),
      body:   Container(
        padding:   EdgeInsets.all(20.0),
        child:   Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [

              TextFormField(
                controller: _controllerTo,
                decoration:  InputDecoration(
                  labelText: 'To',
                  border: OutlineInputBorder(),
                ),
              //   validator: (text) {
              //   if (text == null || text.isEmpty) {
              //     return 'To Email is empty';
              //   }
              //   return null;
              // },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerSubject,
                decoration:  InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                // validator: (text) {
                //   if (text == null || text.isEmpty) {
                //     return 'Subject is empty';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerMessage,
                decoration:  InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                // validator: (text) {
                //   if (text == null || text.isEmpty) {
                //     return 'Message is empty';
                //   }
                //   return null;
                // },
                maxLines: 3,
              ),

              SizedBox(height: 30),
              SizedBox(
                  height: 50, // <-- Your width
                  child:  ElevatedButton(
                    onPressed: () {
                      _launchEmail(
                          _controllerTo.text,
                          _controllerSubject.text,
                          _controllerMessage.text
                      );
                    },
                    child: Text('Send Mail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                  ),

              ),

            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _sentEmail,
      ),
    );


  }
}