import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'modelclass.dart';

class Slide extends StatefulWidget {
  final SlideimageA items_slide;
  const Slide({Key? key, required this.items_slide}) : super(key: key);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade200,
        title: Center(
          child: Text(
            'Slide Images',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back,color: Colors.black,)

        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Center(
                child: Text(
              widget.items_slide.title,
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          CarouselSlider(
              items: widget.items_slide.images.map((e) {
                return Container(
                  color: Colors.red,
                  child: Container(
                    height: 400,
                    width: 300,
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(onPageChanged: (index, reason) {
                setState(() {
                  currentPos = index;
                },
                );
              },
              ),
          ),
          CarouselIndicator(
            color: Colors.black,
            activeColor: Colors.red,
            count: widget.items_slide.images.length,
            index: currentPos,
          ),
        ],
      ),
    );
  }
}
