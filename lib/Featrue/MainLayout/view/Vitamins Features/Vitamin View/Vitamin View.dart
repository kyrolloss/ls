import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Alarms%20Screen.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Vitamine%20Alarms/View/Vitamin%20Alarms.dart';
import 'package:ls/Featrue/MainLayout/view/Vitamins%20Features/Vitamin%20View/Taps/Vitamins%20Tap/Vitamins%20Tap.dart';
import '../../../../../../generated/l10n.dart';
import '../../Alarm Feature/View/Alarms Screen/Tabs/Alarm Feture/View/Alarms/Vitamine Alarms/View Model/vitamin_cubit.dart';
import '../Model View/vitamin_cubit.dart';
import 'Taps/Supplements Tap/Supplements Tap.dart';
import 'Vitamin Details/Vitamin Details.dart';

class VitaminView extends StatefulWidget {
  const VitaminView({super.key});

  @override
  State<VitaminView> createState() => _VitaminViewState();
}

class _VitaminViewState extends State<VitaminView> {
  final List<String> vitamins = const [
    'Vitamin A',
    'Vitamin B',
    'Vitamin C',
    'Vitamin D',
    'Vitamin E',
    'Vitamin K',
    'Omega 3',
  ];

  final List<String> supplements = const [
    'Protein Powder',
    'Creatine',
    'Fish Oil',
    'BCAA',
    'Multivitamin',
    'Iron',
  ];

  final List<String> images = const [
    'assets/images/Vitamin A.png',
    'assets/images/Vitamin B.png',
    'assets/images/Vitamin C.png',
    'assets/images/Vitamin D.png',
    'assets/images/Vitamin E.png',
    'assets/images/Vitamin K.png',
    'assets/images/omega 3.png',
  ];

  final List<String> locations = const [
    'carrots , sweet potatoes, and spinach',
    'meat , eggs , dairy products , and whole grains',
    'citrus fruits , strawberries , and oranges',
    'sunlight , fatty fish , and dairy products',
    'nuts , seeds , and vegetable oils',
    'leafy greens , broccoli , and Brussels sprouts',
    'fatty fish like salmon and tuna , and walnuts',
  ];

  final List<String> benefits = const [
    'Helps maintain eye health and strengthens immunity',
    'Supports energy production and nervous system health',
    'Boosts immunity and maintains skin health',
    'Supports bone health and calcium absorption',
    'Protects cells from damage as an antioxidant',
    'Supports blood clotting and bone health',
    'Promotes heart health and reduces inflammation',
  ];

  final List<String> dailyAmounts = const [
    '700-900 mcg',
    '1 to 3 mg',
    '75-90 mg',
    '600-800 IU',
    '15 mg',
    '90-120 mcg',
    '90-120 mcg',
  ];

  @override
  void initState() {
    super.initState();
    VitaminScreenCubit.get(context).getAllVitamins();
    VitaminScreenCubit.get(context).getAllSupplements();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .sizeOf(context)
        .width;
    double height = MediaQuery
        .sizeOf(context)
        .height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            S
                .of(context)
                .Vitamin_And_Supplements,
            style: GoogleFonts.merriweather(
              fontSize: width * .05,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: S
                  .of(context)
                  .Vitamin),
              Tab(text: S
                  .of(context)
                  .Supplements),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VitaminsTap(),
            SupplementsTap(),
          ],
        ),
      ),
    );
  }


}
