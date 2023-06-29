class Task {
  const Task(
      {required this.id,
      required this.description,
      required this.duedate,
      required this.severity,
      required this.title});

  final int id;
  final String title;
  final String description;
  final String severity;
  final String duedate;

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'severity': severity,
      'duedate': duedate,
    };
  }

  factory Task.fromDatabaseJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['description'],
      duedate: json['duedate'],
      severity: json['severity'],
      title: json['title'],
    );
  }
}
