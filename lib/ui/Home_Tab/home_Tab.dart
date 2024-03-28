import 'package:flutter/material.dart';
import 'package:movies/ui/Home_Tab/popular_list_widget.dart';
import 'package:movies/ui/Home_Tab/recommended_list_widget.dart';

import 'new_list_widget.dart';

class homeTab extends StatelessWidget {
  const homeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          PopularListWidget(),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color(0xff282A28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'New Releases',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "third"),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: NewListWidget(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                color: const Color(0xff282A28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "c"),
                      ),
                    ),
                    SizedBox(height: 220, child: RecommendedListWidget()),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
