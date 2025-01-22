import 'package:flutter/material.dart';



class PricingCard extends StatelessWidget {
   PricingCard({Key? key}) : super(key: key);
  final List<String> steps = ["PATTERN", "GOAL", "USERS", "SUCCESS", "RESOURCES"];
  final List<bool> completed = [true, true, true, false, false];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Center(
      child: Card(
        elevation: 8.0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(12.0),
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Icon(
                  Icons.grid_view,
                  size: 40,
                  color: Colors.deepPurple,
                ),
              ),
              // Plan name
              const Text(
                'Enterprise',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Price
              const Text(
                '\$159 / Month',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              // Description
              const Text(
                'For larger businesses or those seeking advanced services.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // Features list
              Column(
                children: const [
                  FeatureItem(text: 'Unlimited Exercises Access'),
                  const SizedBox(height: 5),
                  FeatureItem(text: 'Unlimited Meals Access'),
                  const SizedBox(height: 5),
                  FeatureItem(text: 'Limited Supplements Access'),
                  const SizedBox(height: 5),
                  FeatureItem(text: 'Limited Reminder Access'),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Row(
      children: [
        const Icon(Icons.check, color: Colors.deepPurple, size: 25),
        const SizedBox(width: 10),
        SizedBox(
          width: width*.45,
          height: height*.06,
          child:Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ),
      ],
    );
  }
}
