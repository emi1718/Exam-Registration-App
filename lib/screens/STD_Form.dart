import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController city = TextEditingController();
  Future<void> insertRecord() async {
    String nameValue = name.text;
    String emailValue = email.text;
    String phoneValue = phone.text;
    String nicValue = nic.text;
    String cityValue = city.text;

    if (nameValue != "" ||
        emailValue != "" ||
        phoneValue != "" ||
        nicValue != "" ||
        cityValue != "") {
      try {
        String url = "http://localhost/erpAPI/insert.php";

        var res = await http.post(Uri.parse(url), body: {
          "name": nameValue,
          "email": emailValue,
          "phone": phoneValue,
          "nic": nicValue,
          "city": cityValue
        });

        var response = jsonDecode(res.body);
        if (response["success"] == true) {
          print("Inserted Data!");
          name.clear();
          email.clear();
          phone.clear();
          city.clear();
          nic.clear();

          Navigator.pushNamed(context, "/stdList");
        } else {
          print("Some Issues");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All Fields!");
    }
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
                        "EXAMINATION FORM",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nic,
                      decoration: InputDecoration(
                          labelText: 'NIC',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: city,
                      decoration: InputDecoration(
                          labelText: 'City',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      insertRecord();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Text(
                      "Add New Student",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            )));
  }
}
