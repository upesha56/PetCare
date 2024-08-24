import 'package:chat/pages/loging_page.dart';
import 'package:chat/pages/petregistration_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

// ignore: non_constant_identifier_names
final typeOfPetController = TextEditingController();

class _userProfileState extends State<userProfile> {
  Future<String?> userProfile() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/user-profile');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['userName'];
      } else {
        return 'Failed to fetch user profile. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'An error occurred. Please try again.';
    }
  }

  void selectPetCategory(String typeOfPet) async {
    // Ensure both fields are filled
    if (typeOfPet.isEmpty) {
      showErrorDialog('Please enter type of pet.');
      return;
    }
    try {
      var url = Uri.parse('http://10.0.2.2:8000/user-profile');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: {"type_of_pet": typeOfPet});
    } catch (e) {
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
        backgroundColor: const Color.fromRGBO(229, 202, 119, 30),
        appBar: AppBar(
            backgroundColor: Colors.amber,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, const login());
              },
              icon: const Icon(Icons.arrow_back_rounded),
            )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30), // Optional
          child: Column(
            children: <Widget>[
              _userDetail(),
              _petCategory(),
              _petAdding(),
            ],
          ),
        ),
      ),
    );
  }

  _userDetail() {
    return FutureBuilder<String?>(
      future: userProfile(), // Call the asynchronous function
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Loading...",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                color: Colors.amberAccent,
                child: const Image(
                  image: AssetImage("assets/loginAndSignin/signin.png"),
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          // Handle errors and null data
          return Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Error",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                color: Colors.amberAccent,
                child: const Image(
                  image: AssetImage("assets/loginAndSignin/signin.png"),
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    snapshot.data ?? "User",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                color: Colors.amberAccent,
                child: const Image(
                  image: AssetImage("assets/loginAndSignin/signin.png"),
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  _petCategory() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Select your pet category",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("dog");
              },
              icon: const Image(image: AssetImage("assets/doglogo.jpg")),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("cat");
              },
              icon: const Image(
                image: AssetImage("assets/catlogo.jpg"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("fish");
              },
              icon: const Image(
                image: AssetImage("assets/fish.jpg"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("rabbit");
              },
              icon: const Image(
                image: const AssetImage("assets/rabbit.jpg"),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _petAdding() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            // Handle the first container tap event here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PetRegistrationPage()),
            );
            // Add your logic here, like navigation or showing a dialog
          },
          child: Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 249, 230, 160),
              image: const DecorationImage(
                  image: AssetImage("assets/petadd.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.7),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline,
                    size: 40, color: Colors.black), // Add your icon
                SizedBox(height: 10), // Spacing between icon and text
                Text(
                  "Add Your Pet",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 249, 230, 160),
            image: const DecorationImage(
              image: AssetImage("assets/petadd.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline,
                  size: 40, color: Colors.black), // Add your icon
              SizedBox(height: 10), // Spacing between icon and text
              Text(
                "Add Your Pet",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
