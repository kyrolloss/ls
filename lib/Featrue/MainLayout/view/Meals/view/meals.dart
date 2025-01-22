import 'package:flutter/material.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import 'DetailsMeals/View/DeatilsMeals.dart';

class FoodListPage extends StatelessWidget {
  final List<Map<String, String>> foods = [
    {
      'name': 'Oatmeal with Fruit and Nuts',
      'image': 'assets/images/595aacf1e27bb4a00ab6c7bb6ab36dd22cace6d3.jpg',
      'description': '1/2 cup oatmeal \n1 cup low-fat milk \n1 banana, sliced \n1/4 cup berries \n2 tablespoons almonds \nCalories: 350 calories.',
      'method': 'Cook oatmeal with milk. Add sliced banana, berries, and top with almonds.',
      'protein': '15g',
      'carbs': '55g',
      'creatine': '0g' // Creatine is not naturally found in these ingredients
    },
    {
      'name': 'Brown Toast with Avocado and Hard-Boiled Eggs',
      'image': 'assets/images/9276c38e69a2e8c9f44ac3d61f89de0f9f407d08.jpg',
      'description': '2 slices brown bread \n1/2 mashed avocado \n2 hard-boiled eggs \nCalories: 400 calories.',
      'method': 'Toast the bread. Mash the avocado and spread on the toast. Top with sliced boiled eggs.',
      'protein': '20g',
      'carbs': '35g',
      'creatine': '0g'
    },
    {
      'name': 'Spinach, Banana and Protein Smoothie',
      'image': 'assets/images/tbl_articles_article_24515_6639a570cb2-142c-4691-9c83-f5f7859e56a9.jpg',
      'description': '1 cup fresh spinach \n1 banana \n1 scoop protein powder \n1 cup unsweetened almond milk \nCalories: 300 calories.',
      'method': 'Blend spinach, banana, protein powder, and almond milk together until smooth.',
      'protein': '25g',
      'carbs': '30g',
      'creatine': '0g'
    },
    {
      'name': 'Peanut Butter on Whole Wheat Bread with Apple Slices',
      'image': 'assets/images/تفاح-مع-زبدة-الفول-السوداني.jpg',
      'description': '2 slices whole wheat bread \n2 tablespoons natural peanut butter \n1 medium apple, sliced \nCalories: 350 calories.',
      'method': 'Spread peanut butter on the bread and serve with apple slices.',
      'protein': '15g',
      'carbs': '45g',
      'creatine': '0g'
    }
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Meals List',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.05, // تغيير حجم الخط بناءً على العرض
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // تغيير الحواف بناءً على العرض
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final food = foods[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailPage(
                      name: food['name']!,
                      image: food['image']!,
                      description: food['description']!,
                      method: food['method']!,
                      protein: food['protein']!,
                      carbs: food ['carbs']!,
                      creatine: food['creatine']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015), // تغيير المسافة العمودية
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03), // تغيير نصف القطر بناءً على العرض
                ),
                child: Row(
                  children: [
                    // صورة الطعام
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(screenWidth * 0.03)),
                      child: Image.asset(
                        food['image']!,
                        fit: BoxFit.cover,
                        width: screenWidth * 0.3, // تغيير العرض بناءً على حجم الشاشة
                        height: screenWidth * 0.3, // تغيير الارتفاع بناءً على حجم الشاشة
                      ),
                    ),
                    // اسم الطعام والوصف
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03), // تغيير الحواف بناءً على العرض
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food['name']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045, // حجم الخط بناءً على العرض
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01), // تغيير المسافة العمودية
                            Text(
                              food['description']!,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035, // حجم الخط بناءً على العرض
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: screenHeight* 0.03),
        child: FloatingActionButton(
          onPressed: () {
            // Action for the camera button
          },
          backgroundColor: Colors.orangeAccent,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: screenWidth * 0.07,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );

  }
}
