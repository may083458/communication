import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sms_advanced/sms_advanced.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SMSPage(),
    ),
  );
}

class SMSPage extends StatefulWidget {
  @override
  _SMSPageState createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  final SmsQuery query = SmsQuery();
  List<SmsThread> threads = [];

  @override
  void initState() {
    super.initState();
    query.getAllThreads.then((value) {
      threads = value;
      setState(() {});
    });
  }

  void _launch(String urlString) async{
    if (await canLaunch(urlString)) {
      await launch(urlString);
    }else{
      throw 'Could not lunch url';
    }
  }
  void _sentSMS() {
    _launch('sms:09422372137');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          // appBar: AppBar(
          //   title: const Text("Example"),
          // ),
          body: ListView.builder(
            itemCount: threads.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minVerticalPadding: 8,
                    minLeadingWidth: 4,
                    leading: Icon(Icons.supervised_user_circle,size:40,color:Colors.red),
                    title: Text(threads[index].messages.last.body ?? 'empty'),
                    subtitle: Text(threads[index].contact?.address ?? 'empty'),
                  ),
                  const Divider()
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _sentSMS,
          ),
        ));
  }
}