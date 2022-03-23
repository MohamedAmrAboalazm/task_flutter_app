import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_app/cubit/cubit.dart';
import 'package:task_flutter_app/modules/on_boarding_screen.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleSpacing: 20,
              iconTheme: IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
              backgroundColor: Colors.white,
              elevation: 0
          ),
            fontFamily: 'Hacen Saudi Arabia',
            bottomNavigationBarTheme:  BottomNavigationBarThemeData(
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey,
              backgroundColor:Colors.white ,
              elevation: 25,
              type: BottomNavigationBarType.fixed,
            ),
            primarySwatch: Colors.indigo) ,
        home:OnBoardingScreen()
      ),
    );
  }
}


