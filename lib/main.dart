import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import './home.dart';
import './contact.dart';
import './mail.dart';
import './sms.dart';
import './profile.dart';
import './setting.dart';
import './about_us.dart';
import './contact_us.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.red,


        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyApp(),

    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String? title;
  String? currentPath;


  void selectScreen(BuildContext context,int n) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_){
          if (n==1) {
            title = "Profile";
            return Profile();
          }
          else if (n==2) return Setting();
          else if (n == 3) return About();
          return ContactUs();
        }
    ));
  }



  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Communicator'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),text: ("Home"),),
                Tab(icon: Icon(Icons.perm_contact_cal_sharp), text: "Contact",),
                Tab(icon: Icon(Icons.sms_sharp), text: "SMS",),
                Tab(icon: Icon(Icons.contact_mail), text: "Mail",),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Home(),
              ContactPage(),
              SMSPage(),
              MailPage(),
            ],
          ),
          drawerScrimColor: Colors.pinkAccent.withOpacity(0.5),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text("May Hnin Phyu"),
                  accountEmail: Text("mayhninphyu@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.red
                        : Colors.white,
                    child: Text("MH",
                      style: TextStyle(fontSize: 40,
                        color: Colors.red,),),
                  ),
                ),
            Container (
              child: Column(
                children: [
                  ListTile(
                    title: Text("Profile", style: TextStyle(fontSize: 20),),
                    subtitle: Text("Profile"),
                    leading: Icon(Icons.supervised_user_circle_sharp,size:40,color:Colors.red),
                    trailing: Icon(Icons.arrow_forward_ios,color:Colors.red),
                    onTap: () => selectScreen(context,1),
                  ),
                  ListTile(
                    title: Text("Setting", style: TextStyle(fontSize: 20),),
                    subtitle: Text("Setting"),
                    leading: Icon(Icons.settings,size:40,color:Colors.red),
                    trailing: Icon(Icons.arrow_forward_ios,color:Colors.red),
                    onTap: () => selectScreen(context,2),
                  ),
                  ListTile(
                    title: Text("About Us", style: TextStyle(fontSize: 20),),
                    subtitle: Text("About Us"),
                    leading: Icon(Icons.account_box_outlined,size:40,color:Colors.red),
                    trailing: Icon(Icons.arrow_forward_ios,color:Colors.red),
                    onTap: () => selectScreen(context,3),
                  ),
                  ListTile(
                    title: Text("Contact Us", style: TextStyle(fontSize: 20),),
                    subtitle: Text("Contact Us"),
                    leading: Icon(Icons.contact_phone_rounded,size:40,color:Colors.red),
                    trailing: Icon(Icons.arrow_forward_ios,color:Colors.red),
                    onTap: () => selectScreen(context,4),
                  ),
                ],
              ),
            ),
              ],
            ),
          ),
        ));


  }
}