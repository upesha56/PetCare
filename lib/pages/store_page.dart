import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  final List<String> imageList = [
    "assets/PetFood.jpeg",
    "assets/PetEquipment.jpeg",
    "assets/PetBelts.jpeg",
    //"assets/image04.jpg",
  ];

  final List<String> imageTitles = [
    "Pet-Food",
    "Pet-Equipment",
    "Pet-Belts",
    // "Pet Community",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // App Bar
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Store",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E).withOpacity(1),
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
              padding: const EdgeInsets.all(70.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(60.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(55.0), // Add some padding if needed
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
              padding: const EdgeInsets.all(10.0), // Add some padding if needed
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
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 800,
                  // Adjust the height as needed
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 100, 30, 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 31, 172, 156),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: AssetImage(imageList[index]),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: const Offset(5, 4.5),
                                  ),
                                ],
                              ),
                              height: 180,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            imageTitles[index],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                                  'CustomFont', // Use the custom font family
                              color: Color.fromARGB(255, 134, 81, 7),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: imageList.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: const Icon(Icons.home)),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityPage(),
                        ));
                  },
                  child: const Icon(Icons.people)),
              label: 'People',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
