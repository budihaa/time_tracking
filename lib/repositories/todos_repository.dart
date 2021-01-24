import 'package:time_tracking/networking/api_provider.dart';
import 'package:time_tracking/models/todos_response.dart';
import 'dart:async';

class TodosRepository {
  ApiProvider _provider = ApiProvider();

  Future<List<Todos>> fetchTodosList() async {
    final response = await _provider.get('todos.json');
    return TodosResponse.fromJson(response).todos;
  }
}
