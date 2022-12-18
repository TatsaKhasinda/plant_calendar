import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_calendar/add_event.dart';
import 'package:plant_calendar/calendar_page.dart';
import 'package:plant_calendar/dashboard.dart';
import 'package:plant_calendar/plant_page.dart';
import 'package:plant_calendar/read_plant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/dashboard',
        routes: {
          '/dashboard': (context) => DashboardPage(),
          '/plant_page': (context) => PlantPage(),
          '/calendar_page': (context) => CalendarPage(),
          '/read_plant_page': (context) => ReadPlantPage(),
          '/add_event_page': (context) => AddEventPage(),
        });
  }
}
