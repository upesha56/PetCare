import 'package:chat/pages/comment_page.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/widgets/first_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar

      appBar: AppBar(
        // App Bar
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Community",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(204, 0, 0, 0),
              fontSize: 30,
            ),
          ),
        ),

        backgroundColor:
            const Color(0xffFFB03E).withOpacity(0.1), // Set to transparent
        elevation: 2,
        // Remove the shadow
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            border: const Border.symmetric(
                                horizontal: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Comment(),
                              ));
                        },
                        icon: const Icon(
                          Icons.photo_library,
                          size: 38,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8, // Reduced the gap
                ),
                const ContainerBox(
                  image: "assets/dog.jpg",
                  description:
                      "Just wanted to share a picture of Bella enjoying her favorite spot in the park. She's such a bundle of joy and always makes every moment special!",
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 8, // Reduced the gap
                ),
                const ContainerBox(
                  image: "assets/cute-cat.jpg",
                  description:
                      "My cat has discovered a new game with her favorite feather toy, and it's been a joy watching her leap and pounce with such excitement! ",
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),

      extendBody: false,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: 2,
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
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {}, child: const Icon(Icons.people)),
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
