import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter_app/constans.dart';

import 'components.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool shpinngfrom=true;
  bool shpinngto=false;
  bool type=false;
  bool enabled=false;
  String dropdownvalue = 'مصر';

  // List of items in our dropdown menu
  var items = [
    'مصر',
    'المملكة العربية السعودية',
    'البحرين',
    'الإمارات العربية المتحدة',
    'العراق',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20.0),bottomStart: Radius.circular(15.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemSelect(image:AssetImage("assets/images/tracking.png"),ShippingFrom:true,ShippingTo: false,typeShipping: false,text: "الشحنه من",Colorphoto:shpinngfrom),
                 buildItemSelect(image:AssetImage("assets/images/tracking.png"),ShippingFrom:false,ShippingTo: true,typeShipping: false,text: "الشحنه الي",Colorphoto: shpinngto),
                   buildItemSelect(image:AssetImage("assets/images/gift.png"),ShippingFrom:false,ShippingTo: false,typeShipping: true,text:"نوع الشحنه",Colorphoto: type),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("أختر الدولة"),
                  Container(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                        items:items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(), onChanged:  (String? newValue) {
                        setState(() {
                             dropdownvalue = newValue!;
                             enabled=true;
                           });},dropdownColor: Colors.white,
                        decoration:InputDecoration()
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("أختر المدينه"),
                  Container(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      disabledHint: Text("من فضلك اختار الدوله "),
                        items:items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged:enabled?  (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });}:null,dropdownColor: Colors.white,
                        decoration:InputDecoration()
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: defaultButton(context, text: "التالي", onPressed: () {
                }, color: PrimaryColor)),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("سوف يتم أرسال رسالة نصية لتأكيد رقم الموبايل",)),
          ],
        ),
      ),
    );
  }
  Widget buildItemSelect({required ImageProvider image,required bool ShippingFrom,required bool ShippingTo,required bool typeShipping,required String text,required bool Colorphoto})
  {
    return  InkWell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colorphoto?PrimaryColor:Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Image(
                color: Colorphoto?Colors.white:Colors.black,
                image: image,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(" $text")
        ],
      ),
      onTap: (){
        setState(() {
          shpinngfrom=ShippingFrom;
          shpinngto=ShippingTo;
          type=typeShipping;
        });

      },
    );
  }
  Widget buildDropdownItem(Country country) =>
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CountryPickerUtils.getDefaultFlagImage(country),
        ),
      );
}
