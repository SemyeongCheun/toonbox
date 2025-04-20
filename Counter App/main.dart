import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  void upBtn() {
    setState(() {
      counter = counter + 1;
    });
  }

  void downBtn() {
    setState(() {
      counter = counter - 1;
    });
  }

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 235, 193),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
              ),
              showTitle
                  ? myLargeTitle(
                      couter: counter,
                    )
                  : Text('empty'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: downBtn,
                    icon: Icon(
                      Icons.remove_circle_outline,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: upBtn,
                    icon: Icon(
                      Icons.add_box_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: toggleTitle,
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// key를 추가해서 couter 변수를 부모 클래스에서 사용하게 하는건 공부 필요
class myLargeTitle extends StatefulWidget {
  final int couter;
  const myLargeTitle({
    Key? key,
    required this.couter,
  }) : super(key: key);

  @override
  State<myLargeTitle> createState() => _myLargeTitleState();
}

class _myLargeTitleState extends State<myLargeTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Click Count',
          style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).textTheme.titleLarge?.color),
        ),
        Text(
          '${widget.couter}',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
