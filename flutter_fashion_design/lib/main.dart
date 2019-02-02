import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Discovery',
          style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera),
            color: Colors.grey,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
        ),
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                SizedBox(width: 35.0),
                listItem('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                SizedBox(width: 35.0),
                listItem('assets/model3.jpeg', 'assets/chloelogo.png'),
                SizedBox(width: 35.0),
                listItem('assets/model1.jpeg', 'assets/chanellogo.jpg'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 4.0,
              child: Container(
                height: 450.0,
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/model1.jpeg'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) -
                              120.0, // 30 + 30+50 + 10
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Daisy',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    '34 mins ago',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                                size: 20.0,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Hero(
                          tag: 'assets/modelgrid1.jpeg',
                          child: Container(
                            height: 200.0,
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/modelgrid1.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                        heroTag: 'assets/modelgrid2.jpeg')));
                              },
                              child: Hero(
                                tag: 'assets/modelgrid2.jpeg',
                                child: Container(
                                  height: 95.0,
                                  width: (MediaQuery.of(context).size.width - 100.0) / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/modelgrid2.jpeg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                        heroTag: 'assets/modelgrid3.jpeg')));
                              },
                              child: Hero(
                                tag: 'assets/modelgrid3.jpeg',
                                child: Container(
                                  height: 95.0,
                                  width: (MediaQuery.of(context).size.width -
                                          100.0) /
                                      2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/modelgrid3.jpeg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(String imgPath, String logo) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            //사람 사진 담을 것
            Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),

            // 디자인회사 로고
            Positioned(
              top: 50.0,
              left: 50.0,
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    image: DecorationImage(
                        image: AssetImage(logo), fit: BoxFit.cover)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 30.0,
          width: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFF916144),
          ),
          child: Center(
            child: Text(
              'Follow',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
