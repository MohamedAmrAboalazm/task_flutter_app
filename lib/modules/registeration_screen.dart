import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/modules/components.dart';
import 'package:task_flutter_app/modules/mobile_number_screen.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image(image: AssetImage("assets/images/registerphoto.jpeg"))),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: Text(
                "مرحبا بكم فى Movers",
                style: TextStyle(fontSize: 30, color: PrimaryColor),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start:30),
              child: Text(
                "أختر أفضل خدمات الشحن ؟",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start:30),
              child: Text(
                "نصلك فى اى مكان , وفى اى وقت",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 20),
              child: defaultButton(context,text: "تسجيل الدخول ",onPressed: (){
                navigateTo(context, PhoneNumberScreen());
              },color: SecondaryColor),
            )),
            Center(child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 20),
              child: defaultButton(context,text: "أنشاء حساب جديد",onPressed: (){},color: PrimaryColor),
            )),
          ],
        ),
      ),
    );
  }
}
