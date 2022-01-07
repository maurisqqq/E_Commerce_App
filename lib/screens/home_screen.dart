// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firstapps/component/color_constant.dart';
import 'package:firstapps/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:firstapps/component/style_constant.dart';
import 'package:firstapps/models/carousel_model.dart';
import 'package:firstapps/models/popular_model.dart';
import 'package:firstapps/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        centerTitle: true,
        title: SvgPicture.asset('assets/svg/logo.svg'),
        elevation: 0,
      ),

      // Setting up Background Color
      backgroundColor: mBackgroundColor,

      // Setting up Custom Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationApp(),

      // Body
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Promos Section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Hi, Maulana This Promos for You!',
                style: mTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(
                          carousels,
                          (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? mBlueColor
                                      : mGreyColor),
                            );
                          },
                        ),
                      ),

                      // More
                      Text(
                        'More...',
                        style: mMoreStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Collections Section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Collections',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 64,
              margin: EdgeInsets.only(right: 16),
              child: ListView.builder(
                itemCount: category.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16, top: 5, bottom: 5),
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                category[index].image,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      category[index].name,
                                      style: mCollectionStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),

            // Popular Section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Hype With Us',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 2.0, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              populars[index].image,
                              height: 180,
                            ),
                            Text(
                              populars[index].name,
                              style: mPopularTitleStyle,
                            ),
                            Text(
                              populars[index].price,
                              style: mPopularSubtitleStyle,
                            ),
                            // More
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Newest Section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Newest Jam',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 800,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Outline, A red Trucker Hat',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 50.00",
                                  textAlign: TextAlign.center,
                                  style: mPopularSubtitleStyle,
                                ),
                                // More
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Outline, A Black Trucker Hat',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 50.00",
                                  style: mPopularSubtitleStyle,
                                ),
                                // More
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Escape, A Dickies Jacket (Red)',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 150.00",
                                  style: mPopularSubtitleStyle,
                                ),
                                // More
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Escape, A Dickies Jacket (Olive Green)',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 150.00",
                                  style: mPopularSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Escape, A Dickies Jacket (Black)',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 150.00",
                                  style: mPopularSubtitleStyle,
                                ),
                                // More
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 10, left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/real_cap_red.jpg',
                                  height: 180,
                                ),
                                Text(
                                  'Rebirth T-Shirt',
                                  style: mPopularTitleStyle,
                                ),
                                Text(
                                  "\$ 50.00",
                                  style: mPopularSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 0, bottom: 12),
              child: Text(
                'More...',
                style: mMoreStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
