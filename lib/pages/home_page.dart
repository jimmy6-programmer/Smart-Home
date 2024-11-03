import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ SmartDeviceName, iconPath, powerStatus  ]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", true],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app Bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Welcome home JIMMY
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome Home,"),
                  Text(
                    "ENG JIMMY",
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                "Smart Devices",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevices.length,
                    padding: const EdgeInsets.all(25),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
