import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plant_calendar/controller/event_controller.dart';
import 'package:plant_calendar/models/event.dart';
import 'package:plant_calendar/widget/input.dart';
import 'package:http/http.dart' as http;

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  Future<List<dynamic>> getData() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/plant_calendar/get.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('PLANT CALENDAR'),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.shrink(); //<---here
          } else {
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List<dynamic> list;
  const ItemList({Key? key, required this.list}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final EventController eventController = Get.put(EventController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ketController = TextEditingController();
  String nama = "Pilih Tanaman";
  DateTime tanggal = DateTime.now();
  String waktuMulai = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String waktuAkhir = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String repeat = "";
  List<String> repeatList = ["None", "Daily"];
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      for (int i = 0; i < widget.list.length; i++) widget.list[i]['plant_name']
    ];
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              hint: "$nama",
              widget: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green,
                ),
                iconSize: 32,
                elevation: 4,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    nama = newValue!;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value!,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }).toList(),
              ),
            ),
            InputField2(
              hint: "Judul Pengingat",
              controller: titleController,
            ),
            InputField(
              hint: DateFormat.yMd().format(tanggal),
              widget: IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.green,
                ),
                onPressed: () {
                  print("Hi there");
                  pickTanggal();
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: InputField(
                  hint: waktuMulai,
                  widget: IconButton(
                    onPressed: () {
                      pickWaktu(isMulai: true);
                    },
                    icon: Icon(Icons.access_time_rounded),
                    color: Colors.green,
                  ),
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: InputField(
                  hint: waktuAkhir,
                  widget: IconButton(
                    onPressed: () {
                      pickWaktu(isMulai: false);
                    },
                    icon: Icon(Icons.access_time_rounded),
                    color: Colors.green,
                  ),
                )),
              ],
            ),
            InputField2(
              hint: "Keterangan",
              controller: ketController,
            ),
            InputField(
              hint: "$repeat",
              widget: DropdownButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green,
                ),
                iconSize: 32,
                elevation: 4,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    repeat = newValue!;
                  });
                },
                items:
                    repeatList.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value!,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: Text('Submit Data'),
                onPressed: () => validateData(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pickTanggal() async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2125));

    if (picker != null) {
      setState(() {
        tanggal = picker;
      });
    } else {}
  }

  pickWaktu({required bool isMulai}) async {
    var waktu = await timePicker();
    String waktuPilih = waktu.format(context);
    if (waktuPilih == null) {
    } else if (isMulai == true) {
      setState(() {
        waktuMulai = waktuPilih;
      });
    } else if (isMulai == false) {
      setState(() {
        waktuAkhir = waktuPilih;
      });
    }
  }

  timePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(DateFormat("hh:mm a")
                .format(DateTime.now())
                .toString()
                .split(":")[0]),
            minute: int.parse(DateFormat("hh:mm a")
                .format(DateTime.now())
                .toString()
                .split(":")[1]
                .split(" ")[0])));
  }

  validateData() {
    if (titleController.text.isNotEmpty && ketController.text.isNotEmpty) {
      insertDb();
      Get.back();
    } else if (titleController.text.isEmpty || ketController.text.isEmpty) {
      Get.snackbar('Wajib diisi', 'Semua kotak wajib diisi',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  insertDb() async {
    int value = await eventController.addEvent(
        event: Event(
      plant: nama,
      note: titleController.text,
      date: DateFormat.yMd().format(tanggal),
      startTime: waktuMulai,
      endTime: waktuAkhir,
      ket: ketController.text,
      repeat: repeat,
      isCompleted: 0,
    ));
  }
}
