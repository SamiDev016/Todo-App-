import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({super.key});

  final List<IconData> icons= [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  final List<String> texts = [
    "Home",
    "Profile",
    "Settings",
    "Details"
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: AppColors.primaryGardientColor,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      )),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT5aCMO24e6ZTz7_TTUdoqiclVyuhAzV0kFw&s"),
          ),
          8.h,
          Text("Adel Ibrahim Sami", style: textTheme.displayMedium,),
          Text("Flutter Dev", style: textTheme.displaySmall,),

          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context,int index){
              return Container(
                child: ListTile(
                  leading: Icon(icons[index],color: Colors.white,size: 30,),
                  title: Text(texts[index]),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
