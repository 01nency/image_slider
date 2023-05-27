import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slide_image/slider_page.dart';

import 'modelclass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade200,
        title: Center(child: Text('Courosal Slider',style: TextStyle(color: Colors.black),)),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: kIsWeb ? 4 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Slide(items_slide: item),),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(item.mainimg,
                                fit: BoxFit.fill)),
                      ),
                      Expanded(flex: 1, child: Text(item.title,style: TextStyle(fontSize: 16),)),
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1 : 0.7);
            }),
      ),
    );
  }
}