import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final address = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var prefs;

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username').isEmpty) {
      setState(() {
        username.text = prefs.getString('username');
        password.text = prefs.getString('password');
        // _value = prefs.getBool('check');
      });
    }
  }

  Future<void> _save() async {
    SharedPreferences prefs = await _prefs;
    prefs.setString('fullname', fullName.text);
    prefs.setString('phonenumber', phoneNumber.text);
    prefs.setString('address', address.text);
    // prefs.setBool('check', true);
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Column(
      children: [
        MenuHeader(),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                nameTextFormField(),
                SizedBox(
                  height: 10,
                ),
                phoneTextFormField(),
                SizedBox(
                  height: 10,
                ),
                emailTextFormField(),
                SizedBox(
                  height: 10,
                ),
                passwordTextFormField(),
                SizedBox(
                  height: 10,
                ),
                conformTextFormField(),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          username.text = value.toString();
        });
      },
      enabled: false,
      controller: username,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }

  TextFormField nameTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          fullName.text = value.toString();
        });
      },
      controller: fullName,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your full name ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField phoneTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          phoneNumber.text = value.toString();
        });
      },
      controller: phoneNumber,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your phone number ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone)),
    );
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      obscureText: true,
      controller: address,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your adress",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      onSaved: (value) {
        setState(() {
          address.text = value.toString();
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  Widget MenuHeader() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: Colors.green),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Account info",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
