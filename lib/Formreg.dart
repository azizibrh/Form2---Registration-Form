import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Formreg extends StatefulWidget {
  const Formreg(
      {super.key,
      required String title,
      required AutovalidateMode autovalidatemode});

  @override
  State<Formreg> createState() => _FormregState();
}

class _FormregState extends State<Formreg> {
  final fkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  String fname = '';
  String mother = '';
  String mobile = '';
  String email = '';
  String password = '';
  String country = '';
  String gender = '';

  String address = '';

  bool policy = false;

  Widget buildtexbox(int index, String label, String hint, IconData icon,
      TextInputType keyboard, bool ispassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        obscureText: ispassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Icon(icon),
        ),
        onSaved: (newValue) {
          if (index == 1) {
            fname = newValue ?? '';
          } else if (index == 2) {
            mother = newValue ?? '';
          } else if (index == 3) {
            mobile = newValue ?? '';
          } else if (index == 4) {
            email = newValue ?? '';
          } else if (index == 5) {
            password = newValue ?? '';
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '$label is required / waa loobahanyahe';
          }

          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill Registration Form / Booxi Registration Formka'),
        backgroundColor: Colors.red.shade400,
      ),
      body: Form(
        key: fkey,
        autovalidateMode: AutovalidateMode.always,
        //title: '', //  please check this.....
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
          child: ListView(
            children: [
              buildtexbox(1, 'Fullname / Magacaga', 'Enter Your Full Name',
                  Icons.person_2_outlined, TextInputType.name, false),
              buildtexbox(
                  2,
                  'Mother Name / Magacaga Hooyada',
                  'Enter Your Full Name',
                  Icons.person_2_outlined,
                  TextInputType.name,
                  false),
              buildtexbox(3, 'Mobile or Phone ', 'Enter Your Phone Number',
                  Icons.phone, TextInputType.phone, false),
              buildtexbox(4, 'Email ', 'Enter Your Email Address Correctly',
                  Icons.email_outlined, TextInputType.emailAddress, false),
              buildtexbox(5, 'Password', 'Enter a Strong Password',
                  Icons.password_outlined, TextInputType.text, true),
              SizedBox(
                height: 15.0,
              ),
              DropdownButtonFormField(
                onSaved: (newValue) {
                  country = newValue ?? '';
                },
                value: country,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Country is required';
                  }
                  return null;
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Select'),
                    value: '',
                  ),
                  DropdownMenuItem(
                    child: Text('Somaliland'),
                    value: 'SL',
                  ),
                  DropdownMenuItem(
                    child: Text('Ethiopia'),
                    value: 'ETH',
                  ),
                  DropdownMenuItem(
                    child: Text('Kenya'),
                    value: 'KE',
                  ),
                  DropdownMenuItem(
                    child: Text('Djibout'),
                    value: 'Dj',
                  ),
                  DropdownMenuItem(
                    child: Text('UAE'),
                    value: 'UAE',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    country = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Country',
                  prefix: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Text(
                    'Gender :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value ?? '';
                      });
                    },
                  ),
                  Text('Male'),
                  SizedBox(
                    width: 50.0,
                  ),
                  Radio(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value ?? '';
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              CheckboxListTile(
                title: Text(
                  'Agree Policy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'I hereby confirm that I accepted all terms and conditions that apply to the use of this software. including distribution rights'),
                value: policy,
                onChanged: (value) {
                  setState(() {
                    policy = value ?? false;
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // to validate the field
                        if (fkey.currentState!.validate()) {
                          fkey.currentState!.save();

                          print('your name is $fname');
                          print('your password is $password');

                          // send it to the api
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.send_outlined),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Submit Data Now'),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
