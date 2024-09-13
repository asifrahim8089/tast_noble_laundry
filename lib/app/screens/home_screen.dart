// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ice_laundry/app/screens/address/address_screen.dart';
import '../widgets/contactus.dart';
import '../widgets/slider_items.dart';
import '../widgets/tabbarview/traditional_view.dart';
import 'cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void showLaundryServicePopup(BuildContext context, bool isCall) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LaundryServicePopup(
          isCall: isCall,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
            leadingWidth: 80.0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[50], // Set your desired background color
                ),
                child: Image.asset(
                  "assets/logo/logo.png",
                ),
              ),
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddressListScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shajeer",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0), // Add padding for spacing
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Set the Row to take only the space of its content
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Colors.red,
                        ),
                        const SizedBox(
                            width:
                                4), // Add some space between the icon and the text
                        Text(
                          "Doha, Qatar",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5), // Add padding around the image
                    child: Image.asset(
                      "assets/images/shopping-cart.png",
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(0, 90),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    icon: CircleAvatar(
                      radius: 22, // Increased radius for extra padding
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding:
                            EdgeInsets.all(5.0), // Adjust padding as needed
                        child: CircleAvatar(
                          radius: 18, // Inner CircleAvatar
                          backgroundImage: AssetImage("assets/images/coat.png"),
                          backgroundColor: Colors
                              .transparent, // Set inner background to transparent
                        ),
                      ),
                    ),
                    child: const Text("Traditional",
                        style: TextStyle(fontSize: 12)),
                  ),
                  Tab(
                    icon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage("assets/images/shirt.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text("Tops", style: TextStyle(fontSize: 12)),
                  ),
                  Tab(
                    icon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage("assets/images/jeans.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    child:
                        const Text("Bottoms", style: TextStyle(fontSize: 12)),
                  ),
                  Tab(
                    icon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/images/suit.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text("Suits", style: TextStyle(fontSize: 12)),
                  ),
                  Tab(
                    icon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage("assets/images/blanket.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text("Home", style: TextStyle(fontSize: 12)),
                  ),
                  Tab(
                    icon: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/images/hair.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    child: const Text("Accessories",
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            )),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CarouselSlider(
                          items: sliderItems,
                          options: CarouselOptions(
                            height: 150.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.7,
                            aspectRatio: 16 / 9,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TraditionalTab(),
              TraditionalTab(),
              TraditionalTab(),
              TraditionalTab(),
              TraditionalTab(),
              TraditionalTab(),
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
              bottom: 80.0,
              right: 0.0,
              child: FloatingActionButton(
                heroTag: "call",
                onPressed: () => showLaundryServicePopup(context, true),
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/phone.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 0.0,
              child: FloatingActionButton(
                heroTag: "chat",
                onPressed: () => showLaundryServicePopup(context, false),
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/chat.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
