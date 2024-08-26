import 'dart:math';

import 'package:chat/pages/loging_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Checkbox.width,
                  ),
                  child: SizedBox(
                    height: 630,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/foot.png',
                    ),
                  ),
                ),
                Opacity(
                  opacity: 1.0,
                  child: SizedBox(
                      height: 360,
                      width: 360,
                      child: Image.asset('assets/wave-cute.png')),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 40,
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ));
                        },
                        child: const Text(
                          "Let's Start",
                          style: TextStyle(
                              color: Color(0xffFFB03E),
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 246, 244),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
