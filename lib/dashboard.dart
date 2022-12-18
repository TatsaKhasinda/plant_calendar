import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_calendar/plant_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('PLANT CALENDAR'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset('images/bg.png'),
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(color: Colors.green)),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/plant_page'),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'TANAMAN',
                                style: TextStyle(color: Colors.green),
                              ),
                              SizedBox(
                                  width: 100,
                                  child: Image.asset('images/plant.png'))
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(color: Colors.green)),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/calendar_page'),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PENGINGAT',
                                style: TextStyle(color: Colors.green),
                              ),
                              SizedBox(
                                  width: 100,
                                  child: Image.asset('images/calendar.png'))
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
