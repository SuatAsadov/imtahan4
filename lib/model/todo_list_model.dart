
 class TodolistModel {

  String? id;
  String?title;
  bool? complated;
  

  TodolistModel({
    required this.id,
    required this.title,
    required this.complated,
  });

  factory TodolistModel.fromJson(Map<String, dynamic> json) {
    return TodolistModel(
        id: json['id'],
       title: json['title'],
        complated: json['complated']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "complated": complated,
      
      };










}



TodolistModel model1 = TodolistModel(
  id: '1',
  title: 'delectus aut autem',
  complated: true,



);