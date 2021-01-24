import 'dart:async';
import 'package:time_tracking/networking/response.dart';
import 'package:time_tracking/repositories/todos_repository.dart';
import 'package:time_tracking/models/todos_response.dart';

class TodosBloc {
  TodosRepository _todosRepository;
  StreamController _todosListController;

  StreamSink<Response<List<Todos>>> get todosListSink => _todosListController.sink;
  Stream<Response<List<Todos>>> get todosListStream => _todosListController.stream;

  TodosBloc() {
    _todosListController = StreamController<Response<List<Todos>>>();
    _todosRepository = TodosRepository();
    fetchTodosList();
  }

  fetchTodosList() async {
    todosListSink.add(Response.loading('Fetching Todos'));
    try {
      List<Todos> todosList = await _todosRepository.fetchTodosList();
      todosListSink.add(Response.completed(todosList));
    } catch (e) {
      todosListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _todosListController?.close();
  }
}
