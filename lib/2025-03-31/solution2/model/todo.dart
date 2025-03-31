class Todo {
  String title;
  bool completed;

  @override
  String toString() {
    // TODO: implement toString
    return 'Todo : { title : $title, completed : $completed }';
  }

  Todo({required this.title, required this.completed});

  Todo.fromJson(Map<String, dynamic> json)
    : title = json["title"],
      completed = json["completed"];
}
