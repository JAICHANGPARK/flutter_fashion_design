import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/dashboard_page.dart';
import 'package:flutter_fashion_design/profile_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_fashion_design/news_model.dart';
import 'dart:convert' as json;

Future<List<Sources>> _fetchNews() async {
  var response = await http.get(
      "https://newsapi.org/v2/sources?apiKey=26177c7ba8a54b4b9c46981f1b53a11d");
  if (response.statusCode == 200) {
    List sources = json.jsonDecode(response.body)['sources'];
    print(sources.length);
    return sources.map((source) => Sources.fromJson(source)).toList();
  } else {
    throw Exception("Failed To Load");
  }
}

class NewsReadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var list_sources;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var _selectedItem = 0;

  Future<Null> refreshListSource() async {
    refreshKey.currentState?.show(atTop: false);

    setState(() {
      list_sources = _fetchNews();
    });

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshListSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "News",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: RefreshIndicator(
            key: refreshKey,
            child: FutureBuilder(
                future: list_sources,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error : ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<Sources> sources = snapshot.data;
                    return ListView(
                      children: sources
                          .map((source) => GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  child: Stack(
                                    children: <Widget>[
                                      BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 10.0, sigmaX: 5.0),
                                        child: Material(
                                          elevation: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5,
                                              sigmaY: 5,
                                            ),
                                            child: Container(
                                              height: 320.0,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          "https://cdn.pixabay.com/photo/2015/11/07/12/02/business-1031754_960_720.jpg"))),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 8.0, sigmaY: 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.2)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15.0,
                                        left: 16.0,
                                        right: 16.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              source.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              source.description,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 16.0,
                                        top: 16.0,
                                        child: Text(
                                          source.category.toUpperCase(),
                                          style: TextStyle(
                                              letterSpacing: 1.2,
                                              color: Colors.white,
                                              fontSize: 24.0),
                                        ),
                                      ),

                                      Positioned(
                                        left: 16.0,
                                        top: 16.0,
                                        child: Text(
                                          source.country.toUpperCase(),
                                          style: TextStyle(
                                              letterSpacing: 1.2,
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  }
                  return CircularProgressIndicator();
                }),
            onRefresh: refreshListSource),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedItem,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chrome_reader_mode, //flutter Icon....
                  color: Colors.black,
                ),
                title: Text(
                  "News",
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;

      print(_selectedItem);

      switch (index) {
        case 0:
          return;
        case 1:
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoardPage()));
          return;

        case 2: // News Page
//          Navigator.of(context).pop();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewsReadPage()));

          return;
        case 3:
//          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserProfilePage()));

          return;
      }
    });
  }
}
