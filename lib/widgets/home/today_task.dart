import 'package:flutter/material.dart';
import 'package:time_tracking/models/todos_response.dart';
import 'package:time_tracking/blocs/todos_bloc.dart';
import 'package:time_tracking/networking/response.dart';

class TodayTask extends StatefulWidget {
  @override
  _TodayTaskState createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  TodosBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = TodosBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 60 / 100,
              child: RefreshIndicator(
                onRefresh: () => _bloc.fetchTodosList(),
                child: StreamBuilder<Response<List<Todos>>>(
                  stream: _bloc.todosListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data.status) {
                        case Status.LOADING:
                          return Loading(loadingMessage: snapshot.data.message);
                          break;
                        case Status.COMPLETED:
                          return TodayTodosList(todoList: snapshot.data.data);
                          break;
                        case Status.ERROR:
                          return Error(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => _bloc.fetchTodosList(),
                          );
                          break;
                      }
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class TodayTodosList extends StatelessWidget {
  final List<Todos> todoList;

  const TodayTodosList({Key key, this.todoList}) : super(key: key);

  Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    var converted;
    if (color.length == 6) {
      converted = Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      converted = Color(int.parse("0x" + color));
    }
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {},
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Material(
                        color: colorConvert(todoList[index].bg_icon),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            todoList[index].icon,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'MaterialIcons',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        todoList[index].title,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text('TWICE',
                          style: TextStyle(
                            fontSize: 12.0,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Retry',
              style: TextStyle(
//                color: Colors.white,
                  ),
            ),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
//              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}
