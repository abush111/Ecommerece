import 'package:flutter/material.dart';
import 'package:flutterapp/Onbroading/onbroading.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          //lets add 3rd screen
          OnboardingPage(
            image: Image.asset('assets/images/delivery.png'),
            title: "Quick & Fast Delivery",
            description:
                "We offers speedy delivery of your  within 30minutes at your doorstep.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
        ],
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
