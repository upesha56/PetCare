import 'package:chat/pages/loging_page.dart';
import 'package:flutter/material.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
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
              "Kawidi Rangalla",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 55,
        ),
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
            child: IconButton(
              onPressed: () {},
              icon: const Image(image: AssetImage("assets/doglogo.jpg")),
            ),
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage("assets/catlogo.jpg"),
              ),
            ),
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage("assets/fish.jpg"),
              ),
            ),
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: const AssetImage("assets/rabbit.jpg"),
              ),
            ),
            width: 80,
            height: 80,
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
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amberAccent,
            image: const DecorationImage(
                image: AssetImage("assets/userProfile/petAdd.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amberAccent,
            image: const DecorationImage(
              image: AssetImage("assets/userProfile/petAdd2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
