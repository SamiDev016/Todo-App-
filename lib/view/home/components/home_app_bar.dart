import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin{
  late AnimationController animateController ;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animateController = AnimationController(vsync: this,
    duration: const Duration(seconds: 1)
    );
    super.initState();
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }


  void onDrawerToggle(){
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animateController.forward();
      } else {
        animateController.reverse();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: onDrawerToggle,
                icon: AnimatedIcon(
                  progress: animateController,
                  icon: AnimatedIcons.menu_close,
                  size: 40,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: (){
                  
                },
                icon: Icon(
                  CupertinoIcons.trash_fill
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
