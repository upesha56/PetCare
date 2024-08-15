import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:flutter/material.dart';

class GPSTracker extends StatelessWidget {
  const GPSTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2CC92),
      appBar: AppBar(
        title: const Text(
          "GPS Tracker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              size: 36,
            ),
          ),
        ],
        backgroundColor: Color(0xffFFB03E),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                width: 390,
                height: 93,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF9E8BD)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Find Your Pet Quickly",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffFFB03E),
                        ),
                        width: 126,
                        height: 40,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 27),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Color(0xffFFB03E), // Background color for the navigation bar
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
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
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StorePage(),
                        ));
                  },
                  child: const Icon(Icons.shopping_cart)),
              label: 'cart',
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
