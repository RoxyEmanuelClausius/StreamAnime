import 'package:carousel_slider/carousel_slider.dart';
import 'package:empty_prox/widgets/MovieSection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Streaming Anime"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 230,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/bg1.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/bg2.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/bg3.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/bg4.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          SizedBox(height: 30),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.only(left: 10, bottom: 10),
            tabs: [
              Tab(text: "All"),
              Tab(text: "Action"),
              Tab(text: "Adventure"),
              Tab(text: "Isekai"),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: [
              MovieSection(),
              Container(),
              Container(),
              Container(),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}
