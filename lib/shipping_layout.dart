import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_app/cubit/cubit.dart';
import 'package:task_flutter_app/cubit/states.dart';
import 'package:task_flutter_app/modules/components.dart';

class ShippingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShippingCubit,ShippingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=ShippingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text("أحسب شحنتك",style:TextStyle(color: Colors.black),)),
              actions: [
                Stack(
                  children: [
                    IconButton(onPressed: (){
                    }, icon: Icon(Icons.notifications_none_rounded,color: Colors.black,size: 35,)),
                    Positioned(
                      right: 10,
                      top: 15,
                      child: new Container(
                        padding: EdgeInsets.all(1),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 10,
                          minHeight: 10,
                        ),
                        ),
                      ),
                  ],
                )
              ],
            ),
            body: cubit.bottomScreens[cubit.CurrentIndex],
            bottomNavigationBar:Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(

                onTap: (value)
                {
                  cubit.changeIndex(value);
                },
                currentIndex: cubit.CurrentIndex,
                items:cubit.BottomItem,
                selectedFontSize: 10,

              ),
            ),

          );
        }
    );
  }
}
