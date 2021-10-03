import 'package:dribble_bicycle_shopping_cart/data_model.dart';
import 'package:dribble_bicycle_shopping_cart/list_items.dart';
import 'package:dribble_bicycle_shopping_cart/screens/Cart_screen.dart';
import 'package:flutter/material.dart';

int heigth;
double imageHeight;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController(
    initialPage: 0,
  );

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    heigth = MediaQuery.of(context).size.height.toInt();
    imageHeight = (heigth * 10.36) / 100;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          onPageChanged: (int index) {
            setState(() {
              _pageIndex = index;
            });
          },
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            Page1(),
            CartScreen(),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff181818),
          child: Icon(
            Icons.mic_none,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: Color(0xffececec),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 0;
                    pageController.animateToPage(_pageIndex,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.bounceIn);
                  });
                },
                padding: EdgeInsets.only(bottom: 18),
                icon: Icon(
                  Icons.home_filled,
                  color:
                      _pageIndex == 0 ? Colors.deepOrangeAccent : Colors.grey,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 1;
                    pageController.animateToPage(_pageIndex,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.bounceIn);
                  });
                },
                padding: EdgeInsets.only(bottom: 18),
                icon: Icon(
                  Icons.shopping_bag,
                  color:
                      _pageIndex == 1 ? Colors.deepOrangeAccent : Colors.grey,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Color allItemsColor = Color(0xff000000);
  Color bicycleColor = Color(0xdcafafaf);
  String hintText = '    Search';

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bike.jpg"),
                ),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    child: Image.asset(
                      'assets/icons/ham_menu.png',
                    ),
                    width: 25,
                    height: 25,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                AnimatedContainer(
                  // padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color(0xfc9c9c9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 55,
                  duration: Duration(milliseconds: 1),
                  width: MediaQuery.of(context).size.width - 200,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Text(
                                  'All Items',
                                  style: TextStyle(
                                      fontSize: 40, color: allItemsColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    allItemsColor = Color(0xff000000);
                                    bicycleColor = Color(0xdcafafaf);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                child: Text(
                                  'Bicycle',
                                  style: TextStyle(
                                      fontSize: 40, color: bicycleColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    allItemsColor = Color(0xdcafafaf);
                                    bicycleColor = Color(0xff000000);
                                  });
                                },
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                cursorColor: Colors.black,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 25),
                onTap: () {
                  setState(() {
                    hintText = '';
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: new Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.grey,
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(30),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                DataModel.title.length,
                (index) {
                  return ListItems(index: index, imageHeight: imageHeight);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
