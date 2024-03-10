import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Соц сети',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Бондарюк Владимир Викторович'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime(
    1990,
    1,
    1,
  );
  Duration _oneDay = Duration(days: 1);
  void _incrementDate() {
    setState(() {
      _selectedDate = _selectedDate.add(_oneDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.green,
              size: 250,
            ),
            Text(
              'Имя пользователя',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    _incrementDate();
                  },
                  child: Text('Плюс один день'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'О себе: Здесь можно написать краткую информацию о себе',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('example@email.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+7 (123) 456-7890'),
                  ),
                  // Другие данные профиля
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
