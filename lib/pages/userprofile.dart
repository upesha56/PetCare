import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

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
        backgroundColor: const Color.fromARGB(255, 249, 246, 244),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // App Bar
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffFFB03E),
                fontSize: 28,
                fontFamily: 'CustomFont',
              ),
            ),
          ),
          backgroundColor: Colors.transparent, // Set to transparent
          elevation: 1.0, // Remove the shadow
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/foot.png",
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.all(70.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.3, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      'assets/paw.png',
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(190.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(60.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 70,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.all(55.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    const EdgeInsets.all(10.0), // Add some padding if needed
                child: Opacity(
                  opacity:
                      0.4, // Adjust the opacity as needed for watermark effect
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset('assets/paw.png'),
                  ),
                ),
              ),
            ), // Background Image (if needed)

            // Foreground Content
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  _userDetail(),
                  _petCategory(),
                  _petAdding(),
                ],
              ),
            ),
          ],
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
            SizedBox(
              height: 120,
            ),
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
            image: AssetImage("assets/dagface.png"),
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
              color: const Color.fromARGB(255, 249, 230, 160),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(image: AssetImage("assets/dagface.png")),
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
              color: const Color.fromARGB(255, 249, 230, 160),
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
              color: const Color.fromARGB(255, 249, 230, 160),
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
              color: const Color.fromARGB(255, 249, 230, 160),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage("assets/rabbit.jpg"),
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
