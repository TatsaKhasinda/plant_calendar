import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadPlantPage extends StatefulWidget {
  const ReadPlantPage({super.key});

  @override
  State<ReadPlantPage> createState() => _ReadPlantPageState();
}

class _ReadPlantPageState extends State<ReadPlantPage> {
  TextEditingController textCode = TextEditingController();
  TextEditingController textPlant = TextEditingController();
  TextEditingController textPupuk = TextEditingController();
  TextEditingController textSiram = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    textCode.text = data['plant_code'].toString();
    textPlant.text = data['plant_name'].toString();
    textPupuk.text = data['pupuk_name'].toString();
    textSiram.text = data['penyiraman'].toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("PLANT CALENDAR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.green),
                readOnly: true,
                controller: textCode,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.green),
                  labelText: "Kode Tanaman",
                  hintText: "Inputkan kode tanaman",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  readOnly: true,
                  controller: textPlant,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    labelText: "Nama Tanaman",
                    hintText: "Inputkan Nama Tanaman",
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  readOnly: true,
                  controller: textPupuk,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    labelText: "Nama Pupuk",
                    hintText: "Inputkan Nama Pupuk",
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  readOnly: true,
                  controller: textSiram,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    labelText: "Penyiraman",
                    hintText: "Inputkan Nama Pupuk",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
