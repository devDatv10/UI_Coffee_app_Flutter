import 'package:coffeeappui/components/button/button_get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelComePage extends StatelessWidget {
  final String appTitle = 'Enjoy your best taste of our coffee';
  final String appDescription =
      'The best grain, the finest roast, the most powerful flavor';

  const WelComePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/images/background/background-welcome.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 5),
                Text(
                  appTitle,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.bebasNeue(fontSize: 50.0, color: Colors.white),
                ),
                Spacer(flex: 20),
                Text(
                  appDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Spacer(flex: 2),
                ButtonGetStarted(
                  text: 'Get Started',
                  onTap: () {
                    Get.toNamed('/homepage');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
