import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:plant_calendar/add_event.dart';
import 'package:plant_calendar/controller/event_controller.dart';
import 'package:plant_calendar/models/event.dart';
import 'package:plant_calendar/services/notification_services.dart';
import 'package:plant_calendar/widget/event_tile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
  }

  final eventController = Get.put(EventController());
  NotifyHelper notifyHelper = NotifyHelper();

  @override
  Widget build(BuildContext context) {
    eventController.getEvents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('PLANT CALENDAR'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Text(
                  'Kalender Pengingat',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
              ),
            ],
          ),
          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.blue),
                weekdayStyle: TextStyle(color: Colors.green)),
            headerStyle: HeaderStyle(
                formatButtonTextStyle: TextStyle(color: Colors.green),
                titleTextStyle: TextStyle(color: Colors.green, fontSize: 20)),
            calendarStyle: const CalendarStyle(
                selectedDecoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                todayDecoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                outsideTextStyle: TextStyle(color: Colors.grey),
                weekendTextStyle: TextStyle(color: Colors.blue),
                defaultTextStyle: TextStyle(color: Colors.green)),
            firstDay: DateTime(2022),
            lastDay: DateTime(2024),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDate, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          showEvents()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () async {
            await Get.to(AddEventPage());
            eventController.getEvents();
          }),
    );
  }

  showEvents() {
    print(eventController.eventList.toJson());
    return Expanded(child: Obx(
      () {
        return ListView.builder(
          itemCount: eventController.eventList.length,
          itemBuilder: (_, index) {
            Event event = eventController.eventList[index];
            if (event.repeat == 'Daily') {
              DateTime date = DateFormat.jm().parse(event.startTime.toString());
              var myTime = DateFormat("HH:mm").format(date);
              //notifyHelper.scheduledNotification(
              //  int.parse(myTime.toString().split(":")[0]),
              //int.parse(myTime.toString().split(":")[1]),
              //event);
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: eventController.eventList.length,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                        child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(context, event);
                        },
                        child: EventTile(event),
                      )
                    ])),
                  ));
            }
            if (event.date == DateFormat.yMd().format(_selectedDate)) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: eventController.eventList.length,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                        child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showBottomSheet(context, event);
                          },
                          child: EventTile(event),
                        )
                      ],
                    )),
                  ));
            } else {
              return Container();
            }
          },
        );
      },
    ));
  }

  showBottomSheet(BuildContext context, Event event) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: event.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
          ),
          Spacer(),
          event.isCompleted == 1
              ? Container()
              : bottomSheetButton(
                  label: "Pengingat Selesai",
                  onTap: () {
                    eventController.markEventCompleted(event.id!);
                    Get.back();
                  },
                  clr: Colors.green,
                  context: context),
          bottomSheetButton(
              label: "Hapus Pengingat",
              onTap: () {
                eventController.delete(event);
                Get.back();
              },
              clr: Colors.blue,
              context: context),
          SizedBox(
            height: 10,
          ),
          bottomSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              clr: Colors.white,
              context: context),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ));
  }

  bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
