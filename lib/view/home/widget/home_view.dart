import 'package:flutter/material.dart';
import 'package:todoapplication/view/home/widget/fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      floatingActionButton: Fab(),

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }


}