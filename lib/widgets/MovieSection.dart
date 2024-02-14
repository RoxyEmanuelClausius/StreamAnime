import 'package:carousel_slider/carousel_slider.dart';
import 'package:empty_prox/screens/MovieScreen.dart';
import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  List images = [
    'genshin',
    'maple',
    'tokyo ghost',
    'blach',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 520,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.8,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            for (int i = 0; i < images.length; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieScreen(images[i])));
                },
                child: AspectRatio(
                  aspectRatio: 16 /
                      9, // Tentukan aspek rasio yang sesuai dengan gambar Anda
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/${images[i]}.jpeg",
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PG-13",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Action",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                SizedBox(width: 5),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        images[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
