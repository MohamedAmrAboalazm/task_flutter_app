import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/modules/components.dart';

class ShipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5,left: 10),
              height: 125,
               width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(15.0),bottomStart: Radius.circular(15.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image(
                      color: PrimaryColor,
                      image: AssetImage("assets/images/tracking.png"),),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                        Text("الشحن خلال",style: TextStyle(fontSize: 22),),
                          SizedBox(width: 10,),
                        Container(
                          height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color:SecondaryColor
                          ),
                            child: Center(child: Text("4 أيام",style:TextStyle(fontSize: 18,color: Colors.white),))),

                      ],),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("التكلفه",style: TextStyle(fontSize: 22),),
                          SizedBox(width: 10,),
                          Container(
                              height: 50,
                               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  color:SecondaryColor
                              ),
                              child: Center(child: Text("30 جنية",style:TextStyle(fontSize: 18,color: Colors.white),))),

                        ],),
                    ],
                  )
                ],
              ),

            ),
            buildItemShipping(shippingwhere: "الشحنه من", image: AssetImage("assets/images/tracking.png"), text: "القاهره الجديده"),
            buildItemShipping(shippingwhere: "الشحنه الي", image: AssetImage("assets/images/tracking.png"), text: "القاهره الجديده"),
            buildItemShipping(shippingwhere: "نوع الشحنه", image: AssetImage("assets/images/gift.png"), text: "طرد 50 كيلو"),

            SizedBox(
              height: 10,
            ),
            Center(child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: defaultButton(context, text: "أحسب شحنتك", onPressed: (){}, color: PrimaryColor),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildItemShipping({required String shippingwhere,required ImageProvider image,required String text})
  {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10,right: 10),
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Image(
              color: Colors.white,
              image: image,
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$shippingwhere"),
              Container(
                width: 120,
                height: 5,
                color: SecondaryColor,
              ),
              Text("$text"),
            ],),
        ),
        SizedBox(width: 30,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color:SecondaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: MaterialButton(
            onPressed: (){},
            child: Text("تـعديل",style:TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}
