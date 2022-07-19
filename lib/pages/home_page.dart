import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/datamodel.dart';
// import 'package:coffee_master/main.dart';
import 'package:coffee_master/pages/menu_list_page.dart';
import 'package:coffee_master/pages/offers_page.dart';
import 'package:coffee_master/pages/order_page.dart';
import 'package:coffee_master/tiles/list_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = DataManager();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentPage = const Text('Home');

    if (selectedIndex == 0) {
      currentPage = HomePage(dataManager: dataManager);
    }
    if (selectedIndex == 1) {
      currentPage = const OffersPage();
    }
    if (selectedIndex == 3) {
      currentPage = OrderPage(
        dataManager: dataManager,
      );
      if (selectedIndex == 2) {
        currentPage = const OffersPage();
      }
      ;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.coffee,
              ),
              label: 'Coffee'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer,
              ),
              label: 'Offer'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Order'),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
      body: currentPage,
    );
  }
}

class HomePage extends StatefulWidget {
  final DataManager dataManager;
  HomePage({Key? key, required this.dataManager}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataManager = DataManager();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 270,
              color: Colors.grey[900],
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text('Karang Baru, Mataram',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              focusColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ListMenuTile(),
                            ListMenuTile(),
                            ListMenuTile(),
                            ListMenuTile(),
                            ListMenuTile(),
                            ListMenuTile(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    child: MenuList(dataManager: dataManager),
                  ),
                ),
              ],
            )
          ],
        ),
        Positioned(
            top: 200,
            left: 30,
            right: 30,
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          'Promo',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text('Buy One Get\nOne Free',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
