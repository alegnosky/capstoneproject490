import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:vpn_capstone/Widgets/roundWidget.dart';
import 'package:vpn_capstone/appPreferences/appPreferences.dart';
import 'package:vpn_capstone/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  BottomNavigation(BuildContext context) {
    return SafeArea(
        child: Semantics(
            button: true,
            child: InkWell(
              onTap: () {},
              child: Container(
                  color: Colors.blueGrey,
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * .04),
                  height: 62,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.flag_circle,
                        color: Colors.white,
                        size: 36,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Select Server Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 26,
                        ),
                      )
                    ],
                  )),
            )));
  }
  Widget vpnButton(){
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: ()
            {

            },
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
                child: Container(
                  width: screenSize.width * .14,
                  height: screenSize.height * .14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new,
                      size: 30,
                      color: Colors.white,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Connect",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
              ),
            ),
          ),
        )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("VPN Capstone Project"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.perm_device_info),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                  AppPreferences.darkMode ? ThemeMode.light : ThemeMode.dark);
              AppPreferences.darkMode = !AppPreferences.darkMode;
            },
            icon: Icon(Icons.brightness_2_sharp),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          vpnButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundWidget(
                  title: "Location",
                  subTitle:"",
                  roundWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.flag_circle,
                      size:30,
                      color: Colors.white,
                    ),
                  )
              ),
              RoundWidget(
                  title: "Ping",
                  subTitle:"",
                  roundWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.graphic_eq_rounded,
                      size:30,
                      color: Colors.white,
                    ),
                  )
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     RoundWidget(
          //         title: "Down",
          //         subTitle:"",
          //         roundWidget: CircleAvatar(
          //           radius: 32,
          //           backgroundColor: Colors.blueGrey,
          //           child: Icon(
          //             Icons.arrow_downward_rounded,
          //             size:30,
          //             color: Colors.white,
          //           ),
          //         )
          //     ),
          //     RoundWidget(
          //         title: "Up",
          //         subTitle:"",
          //         roundWidget: CircleAvatar(
          //           radius: 32,
          //           backgroundColor: Colors.blueGrey,
          //           child: Icon(
          //             Icons.arrow_upward_rounded,
          //             size:30,
          //             color: Colors.white,
          //           ),
          //         )
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
