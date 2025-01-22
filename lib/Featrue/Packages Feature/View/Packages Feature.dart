import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/images/Backage Logo1.jpeg'),
            height: height * .275,
            width: width,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          Text(
            "Get Unlimited To Your Personalized Workout Plan",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * .05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowDirection: VerticalDirection.up,
            overflowSpacing: 10,
            spacing: 10,
            children: [
              _buildOptionCard("1\n Month", 0, "QAR69.99"),
              _buildOptionCard("12\n Months", 1, "QAR12.49"),
              _buildOptionCard("6\n  Months", 2, "QAR16.66"),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.shield_tick5,
                color: Colors.greenAccent,
              ),
              Text(
                " No Commitments, Cancel Anytime",
                style:
                TextStyle(color: Colors.greenAccent, fontSize: width * .03),
              )
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                iconColor: Colors.black,
                fixedSize: Size(
                  width,
                  height * .075,
                )),
            onPressed: () {
              print("Continue pressed for index $selectedIndex");
            },
            child: Text(
              "CONTINUE",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            selectedIndex == 0
                ? 'Total QAR 69.99 / month , Cancel Anytime \n Terms & Conditions'
                : selectedIndex == 1
                ? 'Total QAR 149.99 / year , Cancel Anytime \n Terms & Conditions'
                : 'Total QAR 99.96 / year , Cancel Anytime \n Terms & Conditions',
            style: TextStyle(color: Colors.white60, fontSize: width * .03),
          )
        ],
      ),
    );
  }

  Widget _buildOptionCard(
      String title,
      int index,
      String price,
      ) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: height * .03,
            width: width * .29,
            decoration: BoxDecoration(
                color: selectedIndex != index ? Colors.black : Colors.yellow,
                border: Border.all(
                  color: selectedIndex == index
                      ? Colors.yellow
                      : Colors.transparent,
                  width: selectedIndex == index ? 4 : 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                index == 0
                    ? "10% OFF"
                    : index == 1
                    ? "18% OFF"
                    : "13% OFF",
                style: TextStyle(
                    color: selectedIndex == index ? Colors.black : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: width * .29,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.white : Colors.black,
                border: Border.all(
                  color: selectedIndex == index ? Colors.yellow : Colors.grey,
                  width: selectedIndex == index ? 4 : 1,
                ),
                borderRadius: selectedIndex == index
                    ? BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
                    : null),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.black : Colors.white,
                    fontSize: width * .04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                      selectedIndex == index ? Colors.black : Colors.white,
                      fontSize: width * .04,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Per month",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                      selectedIndex == index ? Colors.black : Colors.white,
                      fontSize: width * .025,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
