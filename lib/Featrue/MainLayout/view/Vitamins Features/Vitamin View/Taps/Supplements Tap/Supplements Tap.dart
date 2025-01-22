import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';

import '../../../../../../../Core/Constant/Loading Indicator/Loading indecator.dart';
import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../../../Alarm Feature/View/Alarms Screen/Alarms Screen.dart';
import '../../Supplement Details/Supplement Details.dart';

class SupplementsTap extends StatelessWidget {
  const SupplementsTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return BlocConsumer<VitaminScreenCubit, VitaminScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return VitaminScreenCubit.get(context).supplementModel == null
            ? Center(
                child: MyLoadingIndicator(
                    height: height * .3, color: kSecondColor),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: VitaminScreenCubit.get(context)
                    .supplementModel!
                    .data
                    .length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      VitaminScreenCubit.get(context).getSpecificSupplements(
                          id: VitaminScreenCubit.get(context)
                              .supplementModel!
                              .data[index]
                              .id
                              .toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupplementDetails(
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: height * .3,
                      width: width * .65,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(125),
                        border: Border.all(
                            color: Colors.white, width: width * 0.01),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: width * .42,
                                height: height * .09,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(125),
                                ),
                                child: Image(
                                  image: NetworkImage(
                                      VitaminScreenCubit.get(context)
                                          .supplementModel!
                                          .data[index]
                                          .image),
                                  width: width * .4,
                                  height: height * .09,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: height * .02),
                              Column(
                                children: [
                                  Text(
                                    VitaminScreenCubit.get(context)
                                        .supplementModel!
                                        .data[index]
                                        .title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * .065,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '500 ml',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * .04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * .575,
                            child: Text(
                              'meat , eggs , dairy products , and whole grains',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * .045,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimerScreen(
                                            value: false,
                                          )));
                            },
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  Iconsax.alarm,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
