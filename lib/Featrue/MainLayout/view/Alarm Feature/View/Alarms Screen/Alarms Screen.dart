import 'package:flutter/material.dart';
import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Sleep%20Alarms/View/Sleep%20Alarms.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Supplement%20Meals/View/Supplement%20Meals.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/View/Workout%20Alarms.dart';
import 'Add Alarm Screen/Add Alarm Screen.dart';
import 'Tabs/Alarm Feture/View/Alarms/Meal Alarms/View/Meal Alarms.dart';
import 'Tabs/Alarm Feture/View/Alarms/Vitamine Alarms/View/Vitamin Alarms.dart';
import 'Tabs/Creatine Feature/View/Creatine Tab.dart';

class TimerScreen extends StatefulWidget {
  final bool value;
  TimerScreen({super.key, required this.value});

  @override
  State<TimerScreen> createState() => _MyAppState();
}

class _MyAppState extends State<TimerScreen> with TickerProviderStateMixin {
  bool value = false;
  TabController? tabController;

  List<String> c = [
    'Meals',
    'Supplement',
    'Sleep',
    'Workout',
    'Vitamin',
    'Creatine',
  ];
  late int num;
  String? selectedValue;

  @override
  void initState() {
    tabController = TabController(
        length: 6, vsync: this, initialIndex: widget.value == true ? 4 : 0);
    num = widget.value == true ? 4 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Alarms',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            num == 5 ? const SizedBox() : GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AddAlarm(index: num,)));
              },
              child: Center(
                child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.add , color: Colors.black,),
                    )),
              ),
            ),
          ],
          centerTitle: true,
          leading: widget.value
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))
              : SizedBox(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: c.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        num = index;
                        tabController!.animateTo(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: num == index ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:  Colors.grey,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        c[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: num == index  ? Colors.black :Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            // Expanded(
            //     child: TabBarView(controller: tabController, children: [
            //   MealsAlarms(),
            //   SupplementsAlarms(),
            //   SleepAlarms(),
            //   WorkoutAlarms(),
            //   VitaminAlarms(),
            //   CreatineTab()
            // ]))
          ],
        ));
  }
}
