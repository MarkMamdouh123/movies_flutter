import 'package:flutter/material.dart';
import 'package:movies/ApiManager/api_manager.dart';
import 'package:movies/BrowseResponse/category_response.dart';
import 'package:movies/ui/BrowseTap/category.dart';
import 'package:movies/ui/BrowseTap/category-item.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = Category.getAllCategories();
    return Scaffold(
      body: FutureBuilder<CategoryResponse>(
        future: apiManager.getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoryResponse = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    'Browse Category',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "a"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        var genres = categoryResponse.genres![index];
                        return CategoryFragment(genres, categories[index]);
                      },
                      itemCount: categoryResponse.genres?.length,
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error loading category.');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
