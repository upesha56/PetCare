import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecordBookPage extends StatefulWidget {
  const RecordBookPage({super.key});

  @override
  State<RecordBookPage> createState() => _recordBookState();
}

class _recordBookState extends State<RecordBookPage> {

    // text editing controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();


  bool isLoading = false;

  // sign user in method
  void signInUser() async {
    setState(() {
      isLoading = true;
    });

    var email = emailController.text;
    var name = nameController.text;
    var age = ageController.text;
    var phone_number = phoneNumberController.text;
    var address = addressController.text;


    // Ensure both fields are filled
    if (email.isEmpty || name.isEmpty|| age.isEmpty || phone_number.isEmpty || address.isEmpty ) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('Please fill all the fields');
      return;
    }
    try {
      var url = Uri.parse('http://10.0.2.2:8000/update-profile');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "name": name, "age" : age, "phone_number" : phone_number, "address" : address}));

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['detail'] == 'Update user successfully') {
          print("add");
        } else {
          showErrorDialog(data['detail'].toString());
        }
      } else {
        var data = json.decode(response.body);
        showErrorDialog(data['detail'].toString());
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog('An error occurred. Please try again.');
    }
  }

    //error showing method
  void showErrorDialog(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _profilePic(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _nameField(context),
              const SizedBox(height: 20),
              _ageField(context),
              const SizedBox(height: 20),
              _phoneField(context),
              const SizedBox(height: 20),
              _addressField(context),
              const SizedBox(height: 20),
              _createProfileButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add_a_photo, size: 50),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _nameField(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _ageField(BuildContext context) {
    return TextField(
      controller: ageController,
      decoration: const InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _phoneField(BuildContext context) {
    return TextField(
      controller: phoneNumberController,
      decoration: const InputDecoration(
        labelText: 'Phone no',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: addressController,
      decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _createProfileButton(BuildContext context) {
    return SizedBox(
      width: 220.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle create profile action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text('Create Profile'),
      ),
    );
  }
}
