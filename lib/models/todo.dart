class Todo{
  int id;
  String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      id: json["id"],
      title: json["title"],
      completed: json["completed"]
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id,
      "title": title,
      "completed": completed
    };
    return data;
  }
}