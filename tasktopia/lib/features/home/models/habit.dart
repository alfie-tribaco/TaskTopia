class Habit {
  Habit({required this.counter, required this.title, required this.id});
  int? id;
  String title;
  int counter;

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'title': title,
      'counter': counter,
    };
  }

  factory Habit.fromDatabaseJson(Map<String, dynamic> json) {
    return Habit(
        counter: json['counter'], title: json['title'], id: json['id']);
  }
}
