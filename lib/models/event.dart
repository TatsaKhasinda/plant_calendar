class Event {
  int? id;
  String? plant;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  String? repeat;
  String? ket;
  int? isCompleted;

  Event({
    this.id,
    this.plant,
    this.note,
    this.date,
    this.startTime,
    this.endTime,
    this.repeat,
    this.ket,
    this.isCompleted
  });

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plant = json['plant'];
    note = json['note'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    repeat = json['repeat'];
    ket = json['ket'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plant'] = this.plant;
    data['note'] = this.note;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['repeat'] = this.repeat;
    data['ket'] = this.ket;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
