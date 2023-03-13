import 'package:flutter/material.dart';
import 'package:flutterapp/Onbroading/onbroading.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //lets add 3rd screen
            OnboardingPage(
              image: Image.asset('assets/images/deimage.png'),
              title: 'Easy Transaction and Payment',
              description:
                  "We provide quick delivery of your items at your door in a very brief time frame.",
              noOfScreen: 3,
              onNextPressed: changeScreen,
              currentScreenNo: 2,
            ),
          ],
        ),
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
