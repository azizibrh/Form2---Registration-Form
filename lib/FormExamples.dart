import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FromExamples extends StatefulWidget {
  const FromExamples({super.key, required String title});

  @override
  State<FromExamples> createState() => _FromExamplesState();
}

class _FromExamplesState extends State<FromExamples> {
  final fkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  String fname = '';
  String mother = '';
  String mobile = '';
  String email = '';
  String password = '';
  String country = '';
  String gender = '';
  bool policy = false;

  Widget buildtexbox(int index, String label, String hint, IconData icon,
      TextInputType keyboard, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        obscureText: isPassword,
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
            return '$label is required';
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
        title: Text('Fill Registration'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: fkey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: ListView(
            children: [
              buildtexbox(1, 'Fullname', 'Enter your fullname',
                  Icons.person_2_outlined, TextInputType.name, false),
              buildtexbox(2, 'Mother', 'Enter your mother fullname',
                  Icons.person_2_outlined, TextInputType.name, false),
              buildtexbox(3, 'Mobile', 'Enter your mobile', Icons.phone,
                  TextInputType.phone, false),
              buildtexbox(4, 'Email', 'Enter your Email', Icons.email_outlined,
                  TextInputType.emailAddress, false),
              buildtexbox(5, 'Password', 'Enter strong password',
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
                    value: 'sl',
                  ),
                  DropdownMenuItem(
                    child: Text('Ethiopia'),
                    value: 'et',
                  ),
                  DropdownMenuItem(
                    child: Text('Kenya'),
                    value: 'ke',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    country = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Country',
                  prefixIcon: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Text(
                    'Gender:',
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
                        // to validate the fields
                        if (fkey.currentState!.validate()) {
                          fkey.currentState!.save();

                          print('your name is $fname');
                          print('your password is $password');

                          //send the to api
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.send_outlined),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Submit Data'),
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
