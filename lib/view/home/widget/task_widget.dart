
import 'package:flutter/material.dart';
import 'package:todoapplication/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 16),
        duration: const Duration(microseconds: 600),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, 4),
                  blurRadius: 10)
            ]),
        child: ListTile(
          //Icon Check or inCheck
          leading: GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .8),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
      
      
          //text title
          title: const Padding(
            padding: EdgeInsets.only(bottom: 5,top: 3),
            child: Text(
              "Done",
              style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.w500,
                  //decoration: TextDecoration.lineThrough
                  ),
            ),
          ),
        
      
          //Text Decs
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.lineThrough
                ),
              ),
      
      
              //Date
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top:10,bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                      ),),
                  
                  
                      Text("subDate",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
