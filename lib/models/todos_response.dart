class TodosResponse {
  List<Todos> todos;

  TodosResponse({this.todos});

  TodosResponse.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = new List<Todos>();
      json['todos'].forEach((v) {
        todos.add(new Todos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todos {
  int id;
  String title;
  String timer;
  String icon;
  String bg_icon;
  bool isRunning;
  bool completed;
  List<Categories> categories;
  String createdAt;

  Todos({
    this.id,
    this.title,
    this.timer,
    this.icon,
    this.bg_icon,
    this.isRunning,
    this.completed,
    this.categories,
    this.createdAt,
  });

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    timer = json['timer'];
    icon = json['icon'];
    bg_icon = json['bg_icon'];
    isRunning = json['is_running'];
    completed = json['completed'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['timer'] = this.timer;
    data['icon'] = this.icon;
    data['bg_icon'] = this.bg_icon;
    data['is_running'] = this.isRunning;
    data['completed'] = this.completed;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Categories {
  int id;
  String title;
  String bgColor;
  String textColor;

  Categories({this.id, this.title, this.bgColor, this.textColor});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bgColor = json['bg_color'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['bg_color'] = this.bgColor;
    data['text_color'] = this.textColor;
    return data;
  }
}
