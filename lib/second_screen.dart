import 'package:app_lab1_women/user.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  List<User> users;
  final String emailAccess;

  SecondScreen(this.users, this.emailAccess);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(child: Text("data"),),
      endDrawer: Drawer(child: Text("data"),),
      appBar: AppBar(
        title: Text(widget.emailAccess),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: widget.users.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(widget.users[index].name),
                  subtitle: Text(widget.users[index].email),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
