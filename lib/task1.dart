import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _berriesImg = [
    'https://i.pinimg.com/originals/a5/e0/47/a5e047d302b0e1f0165694151c6da274.png',
    'https://i.dlpng.com/static/png/9978_preview.png',

    'https://pngimg.com/uploads/blackberry/blackberry_PNG45.png',
    'https://i.dlpng.com/static/png/1624954-sea-buckthorn-hd-png-pluspngcom-341-sea-buckthorn-hd-png-sea-buckthorn-png-341_265_preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _header(context),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _berriesImg.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.network('${_berriesImg[index]}'),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text('Direction'),
              Text(
                  'Place the apple juice, banana, berries and yogurt in a blender; blend until smooth. If the smoothie seems too thick, add a little more liquid (1/4 cup). Taste and add honey if desired. Pour into two glasses and garnish with fresh berries and mint sprigs if desired.'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(children: [
                  Text(
                    'Easy',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Difficulty',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ]),
              ),
              Container(
                height: 50,
                width: 5,
                color: Colors.grey,
              ),
              Container(
                child: Column(children: [
                  Text(
                    '400 Ca',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Calories',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 80,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.pink[900], borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            'Begin Making',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          )),
        ),
      ]),
    );
  }

  _header(BuildContext context) => Container(
        height: 390,
        width: 428,
        color: Colors.pink[900],
        padding: EdgeInsets.only(top: 20, left: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Berry',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white),
                        ),
                        Text(
                          'Smoothie',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      Align(
                        child: Image.network(
                            'https://www.pngkit.com/png/full/380-3801623_helado-de-fruta-png-strawberry-yogurt-smoothie-png.png'),
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
      );
}
