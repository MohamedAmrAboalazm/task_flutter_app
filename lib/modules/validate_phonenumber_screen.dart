import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/modules/components.dart';
import 'package:task_flutter_app/shipping_layout.dart';

class VaidatePhoneNumber extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
                child: Image(image: AssetImage("assets/images/validate.jpeg"))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "برجاء أدخال رمز التأكيد",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.slide,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderWidth: 5,
                  fieldHeight: 50,
                  fieldOuterPadding: EdgeInsets.all(10),
                  activeFillColor: PrimaryColor,

                ),
                onChanged: (String value) {},
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: defaultButton(context, text: "تسجيل", onPressed: () {
              navigateTo(context, ShippingLayout());
            }, color: PrimaryColor)),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("تم ارسال كود التفعيل على هذا الرقم")),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("لم تحصل على رمز التأكيد ؟ ")),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("ارسال رمز التأكيد مرة أخري (66:10)")),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Text("الدخول"),
                ),
                Container(
                  width: 100,
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOutLineBottom(
                      text: "Facebook",
                      image: AssetImage(
                        "assets/images/facebook.jpg",
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  buildOutLineBottom(
                      text: "Google",
                      image: AssetImage("assets/images/google.png")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownItem(Country country) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
            ],
          ),
        ),
      );
}
