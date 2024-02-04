import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                      // Закрываем Drawer и выполняем необходимые действия для Item 1
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {
                      // Закрываем Drawer и выполняем необходимые действия для Item 2
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: Colors.blue,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('MYAPP')],
                      ),
                      const Expanded(child: SizedBox()),
                      CupertinoTabBar(
                        currentIndex: index,
                        onTap: (value) => setState(() {
                          index = value;
                        }),
                        backgroundColor: Colors.blue,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.ac_unit_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Winter',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            activeIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.ac_unit_rounded,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Winter',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.spa_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Spring',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            activeIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.spa_rounded,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Spring',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          BottomNavigationBarItem(
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.sunny,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Summer',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              activeIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.sunny,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Summer',
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              )),
                          BottomNavigationBarItem(
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.mood,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Smile',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              activeIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.mood,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Smile',
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: IndexedStack(
              index: index,
              children: [
                Gender(),
                MyHomePage(),
                ShowSnackBar(),
                LaptopTableWidget()
              ],
            )));
  }
}

class Laptop {
  final String brand;
  final String model;
  final double price;

  Laptop({
    required this.brand,
    required this.model,
    required this.price,
  });
}

class LaptopTableWidget extends StatelessWidget {
  final List<Laptop> laptops = [
    Laptop(
      brand: 'Dell',
      model: 'XPS 13',
      price: 1299.99,
    ),
    Laptop(
      brand: 'HP',
      model: 'Spectre x360',
      price: 1499.99,
    ),
    Laptop(
      brand: 'Apple',
      model: 'MacBook Air',
      price: 999.99,
    ),
    Laptop(
      brand: 'Lenovo',
      model: 'ThinkPad X1 Carbon',
      price: 1399.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Бренд')),
        DataColumn(label: Text('Модель')),
        DataColumn(label: Text('Цена')),
      ],
      rows: laptops.map((laptop) {
        return DataRow(cells: [
          DataCell(Text(laptop.brand)),
          DataCell(Text(laptop.model)),
          DataCell(Text('\$${laptop.price.toStringAsFixed(2)}')),
        ]);
      }).toList(),
    );
  }
}

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Привет, это SnackBar!'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Показать SnackBar'),
      ),
    );
  }
}

class ProgresIndicator extends StatelessWidget {
  const ProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(),
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool maleSelected = false;
  bool femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: Checkbox(
            value: maleSelected,
            onChanged: (value) {
              setState(() {
                maleSelected = value!;
                femaleSelected = false;
              });
            },
          ),
          title: Text('Мужской'),
        ),
        ListTile(
          leading: Checkbox(
            value: femaleSelected,
            onChanged: (value) {
              setState(() {
                femaleSelected = value!;
                maleSelected = false;
              });
            },
          ),
          title: Text('Женский'),
        ),
      ],
    );
  }
}

class ListV extends StatefulWidget {
  const ListV({super.key});

  @override
  State<ListV> createState() => _ListVState();
}

class _ListVState extends State<ListV> {
  List<String> items = ['Элемент 1', 'Элемент 2', 'Элемент 3'];
  List<bool> checkedItems = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          trailing: Checkbox(
            value: checkedItems[index],
            onChanged: (value) {
              setState(() {
                checkedItems[index] = value!;
              });
            },
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> iconDescriptions = [
    'Описание иконки 1',
    'Описание иконки 2',
    'Описание иконки 3',
    'Описание иконки 4',
    'Описание иконки 5',
    'Описание иконки 6',
  ];

  Icon getRandomIcon() {
    List<IconData> icons = [
      Icons.access_alarm,
      Icons.accessibility,
      Icons.airplanemode_active,
      Icons.directions_bike,
      Icons.favorite,
      Icons.star,
    ];
    int randomIndex = Random().nextInt(icons.length);
    return Icon(icons[randomIndex], size: 32, color: Colors.blue);
  }

  @override
  void initState() {
    Timer(Duration(microseconds: 500), () {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Next?'),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text('No'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text('Yes'),
                      ),
                    ),
                  )
                ],
              )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Play Song?',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'play some song',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.white,
                      child: const Center(
                        child: Text('No'),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.white,
                      child: const Center(
                        child: Text('No'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: getRandomIcon(),
                  title: Text('Элемент $index'),
                  subtitle: Text(iconDescriptions[index]),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
