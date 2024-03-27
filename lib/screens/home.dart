import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "EMiCoaching",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
// drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text("MImran"),
                accountEmail: Text("emrankhan@Gmail.com")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "Student List",
              ),
              onTap: () {
                Navigator.pushNamed(context, "/stdList");
              },
            ),
                ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                "Add New Student",
              ),
              onTap: () {
                Navigator.pushNamed(context, "/newStd");
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 19, 145, 255),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Home Page",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),]),))
    );
  }
}
