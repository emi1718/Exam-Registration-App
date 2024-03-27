import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class update extends StatefulWidget {
  String id = "";
  String name = "";
  String email = "";
  String phone = "";
  String nic = "";
  String city = "";
  update(this.id, this.name, this.email, this.phone, this.nic, this.city);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController city = TextEditingController();
  var result;
  Future<void> UpdateRecord() async {
    String idValue = id.text;
    String nameValue = name.text;
    String emailValue = email.text;
    String phoneValue = phone.text;
    String nicValue = nic.text;
    String cityValue = city.text;
    try {
      String url = "http://localhost/erpAPI/update.php";
      var response = await http.post(Uri.parse(url), body: {
        "id": idValue,
        "name": nameValue,
        "email": emailValue,
        "phone": phoneValue,
        "nic": nicValue,
        "city": cityValue
      });

      result = jsonDecode(response.body);

      if (result["success"]== true) {
        print("Data Updated ${name}");
        Navigator.pushNamed(context, "/stdList");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    id.text = widget.id;
    name.text = widget.name;
    email.text = widget.email;
    phone.text = widget.phone;
    nic.text = widget.nic;
    city.text = widget.city;

    // TODO: implement initState
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
                        "UPDATE FORM",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: id,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: 'Id',
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
                      UpdateRecord();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            )));
  }
}
