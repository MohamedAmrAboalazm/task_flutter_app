import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/cubit/cubit.dart';
import 'package:task_flutter_app/cubit/states.dart';
import 'package:task_flutter_app/modules/components.dart';
import 'package:task_flutter_app/modules/validate_phonenumber_screen.dart';
import 'package:task_flutter_app/shipping_layout.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text="20";
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShippingCubit,ShippingStates>(
      listener: (context, state) {},
      builder: (context, state) =>Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                  child:
                  Image(image: AssetImage("assets/images/phonenumber.jpeg"))),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Mobile",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                CountryPickerDropdown(
                  initialValue: "eg",
                  itemBuilder: buildDropdownItem,
                  onValuePicked: (country) {
                    print("${country.name}");
                    print("${country.phoneCode}");
                        textController.text=country.phoneCode;
                        print(textController.text);

                  },
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: textController,
                        keyboardType: TextInputType.number,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: defaultButton(context,
                    text: "تسجيل",
                    onPressed: () {
                      navigateTo(context, VaidatePhoneNumber());
                    },
                    color: PrimaryColor)),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("سوف يتم أرسال رسالة نصية لتأكيد رقم الموبايل")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
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
              padding: const EdgeInsetsDirectional.only(bottom:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOutLineBottom(text: "Facebook",image:AssetImage("assets/images/facebook.jpg",)),
                  SizedBox(width: 10,),
                  buildOutLineBottom(text: "Google",image:AssetImage("assets/images/google.png")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownItem(Country country) =>
      Container(
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
