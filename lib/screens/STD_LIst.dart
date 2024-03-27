import 'dart:convert';
import 'dart:html';

import 'package:erp/screens/update_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  var list = [];
  Future<void> getList() async {
    String url = "http://localhost/erpAPI/view.php";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        list = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRecord(String id) async {
    String url = "http://localhost/erpAPI/delete.php";
    try {
      var response = await http.post(Uri.parse(url), body: {"id": id});

      Map<String, dynamic> deleteResult = jsonDecode(response.body);

      if (deleteResult["success"] == true) {
        print("Deleted Recode ${id}");
        Navigator.pushNamed(context, "/stdList");
      } else {
        print("have some issue!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => update(
                              list[index]["id"],
                              list[index]["name"],
                              list[index]["email"],
                              list[index]["phone"],
                              list[index]["nic"],
                              list[index]["city"]
                                                       )
                              
                              ));
                },
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  child: Text(
                    list[index]["id"],
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                title: Text(
                  list[index]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list[index]["email"]),
                    SizedBox(height: 4),
                    Text(
                      list[index]["phone"],
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(height: 4),
                    Text(
                      list[index]["nic"],
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 4),
                    Text(
                      list[index]["city"],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteRecord(list[index]["id"]);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
