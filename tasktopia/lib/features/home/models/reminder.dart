class Reminder {
  Reminder(
      {required this.date, required this.time, required this.title, this.id});

  int? id;
  String title;
  String time;
  String date;

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'date': date,
    };
  }

  factory Reminder.fromDatabaseJson(Map<String, dynamic> json) {
    return Reminder(
        date: json['date'],
        time: json['time'],
        title: json['title'],
        id: json['id']);
  }
}
