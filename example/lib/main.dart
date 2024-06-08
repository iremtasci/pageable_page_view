import 'package:pageable_page_view/pageable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:pageable_pageview_example/pencil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pageable Page View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pageable Page View Demo'),
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
  final List<dynamic> itemList = [
    Pencil('Red', 'M'),
    Pencil('Blue', 'M'),
    Pencil('Yellow', 'M'),
    Pencil('Orange', 'M'),
    Pencil('Black', 'M'),
    Pencil('White', 'M'),
    Pencil('White', 'L'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageablePageView(
        titleDisplay: (item) => item.color.toString(),
        subTitleDisplay: (item) => item.size.toString(),
        itemDisplay: (item) => 'Renk: ${item}, Boyut: ${item}',
        list: itemList,
        itemPerPage: 2,
        listTileOnTap: listOntp,
      ),);
  }
  listOntp(){
    print("list on tap");
  }
}
