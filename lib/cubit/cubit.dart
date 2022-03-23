import 'package:bloc/bloc.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_app/cubit/states.dart';
import 'package:task_flutter_app/modules/branches_screen.dart';
import 'package:task_flutter_app/modules/calculate_shipment.dart';
import 'package:task_flutter_app/modules/myaccout_screen.dart';
import 'package:task_flutter_app/modules/shipment_screen.dart';

import '../modules/home_screen.dart';

class ShippingCubit extends Cubit<ShippingStates> {
  ShippingCubit() : super(ShippingInitialState());

  static ShippingCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<Widget> bottomScreens = [
    HomeScreen(),
    CalculateShipmentScreen(),
    ShipmentScreen(),
    BranchesScreen(),
    MyAccoutScreen(),
  ];
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "الرئيسية ",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate_outlined),
      label: "أحسب شحنتك",

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_shipping_outlined),
      label: "شحنتك",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home_work_outlined),
      label: "فروعنا",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "حسابي ",
    ),
  ];
  void changeIndex(int index) {
    CurrentIndex = index;
    emit(ShippingBottomNavStyate());
  }


}