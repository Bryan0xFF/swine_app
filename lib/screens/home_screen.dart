import 'package:flutter/material.dart';
import '../widgets/home_gridview.dart';
import '../helpers/underscreen_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.94 -
                  MediaQuery.of(context).size.height * 0.05 -
                  MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: RawScrollbar(
                isAlwaysShown: true,
                thickness: 5,
                thumbColor: Colors.grey[400],
                child: HomeGridView(),
              ),
            ),
            UnderscreenMenu()
          ],
        ),
      ),
    );
  }
}
