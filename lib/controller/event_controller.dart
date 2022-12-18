import 'package:get/get.dart';
import 'package:plant_calendar/helpers/db_helper.dart';
import 'package:plant_calendar/models/event.dart';

class EventController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var eventList = <Event>[].obs;

  Future<int> addEvent({Event? event}) async {
    return await dbHelper.insert(event!);
  }

  void getEvents() async {
    List<Map<String, dynamic>> events = await dbHelper.query();
    eventList
        .assignAll(events.map((data) => new Event.fromJson(data)).toList());
  }

  void delete(Event event) {
    dbHelper.delete(event);
    getEvents();
  }

  void markEventCompleted(int id) async {
    await dbHelper.update(id);
    getEvents();
  }
}
