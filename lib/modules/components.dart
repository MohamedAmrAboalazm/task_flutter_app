
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget defaultButton(context,{required String text,required void Function()? onPressed,required Color color})=>Container(
  width: MediaQuery.of(context).size.width*.75,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(5),
  ),
  child: MaterialButton(
    
      onPressed: onPressed,
    child: Text(text!.toUpperCase(),style:TextStyle(color: Colors.white,fontSize: 20),),
  ),
);


void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>widget
    )
);

void navigateAndFinsh(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=> widget,),
        (route) => false);

Widget buildOutLineBottom({required String text,required ImageProvider image})=> OutlinedButton(
  onPressed: () {},
  child: Row(
    children: [
      Image(image:image,width:20,height: 20,),
      SizedBox(width: 4,),
      Text("$text",style:TextStyle(color: Colors.black),)
    ],
  ),
);
