import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List<String> _berriesImg = [
    'https://i.pinimg.com/originals/a5/e0/47/a5e047d302b0e1f0165694151c6da274.png',
    'https://i.pinimg.com/originals/d1/78/64/d17864d2bc38dbce9b9692b9a658b5d2.png',
    'https://pngimg.com/uploads/blackberry/blackberry_PNG45.png',
    'https://i.dlpng.com/static/png/1624954-sea-buckthorn-hd-png-pluspngcom-341-sea-buckthorn-hd-png-sea-buckthorn-png-341_265_preview.png',
  ];
  int _currentIndex = 0;

  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          carouselController: _controller,
          items: _berriesImg.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    alignment: Alignment.center,
                    child: Image.network('$img'));
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _berriesImg.map((e) {
            print(e);
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex ==  _berriesImg.indexOf(e)? Colors.black : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    ));
  }
}
