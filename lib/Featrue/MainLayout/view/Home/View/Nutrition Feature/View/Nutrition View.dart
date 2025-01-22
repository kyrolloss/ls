import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/Model/Nuturition%20Model.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/View%20Model/nutrition_cubit.dart';

import '../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import 'Widget/Progress.dart';

class NutritionView extends StatefulWidget {
  const NutritionView({super.key});

  @override
  State<NutritionView> createState() => _NutritionViewState();
}

class _NutritionViewState extends State<NutritionView> {
  UniqueKey listKey = UniqueKey();
  UniqueKey listKey2 = UniqueKey();



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
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
          )),
      body: Column(
        children: [
          BlocConsumer<NutritionCubit, NutritionState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  NutritionCubit.get(context).pickImage();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  borderPadding: EdgeInsets.all(6),
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: height * .3,
                      width: width,
                      child: state is! GetImageNutritionLoading
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/images/cloud-computing.png',
                                  ),
                                  fit: BoxFit.fill,
                                  height: height * .12,
                                  width: width * .27,
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                Text(
                                  'Add Your Image Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: width * .04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : MyLoadingIndicator(
                              height: height * .1, color: kSecondColor),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * .04,
          ),
          ProgressPercentage(),
          SizedBox(
            height: height * .05,
          ),
        BlocConsumer<NutritionCubit, NutritionState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return  NutritionCubit.get(context).nutritionItems != null?  Column(
                children: [
                  SizedBox(
                    height: height*.4,
                    width: width*.9,

                    child: ListView.builder(
                      key:  listKey,
                      itemCount: 5,
                        itemBuilder: (context, index1) {
                      return Column(
                        children: [

                          Text(
                            NutritionCubit.get(context)
                                .nutritionItems!.data![index1].displayName!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),

                          SizedBox(
                            height: height*.02,
                          ),
                          SizedBox(
                            width: width*.9,
                            child: GridView.builder(
                              shrinkWrap: true,
                              key: listKey2,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: NutritionCubit.get(context)
                                  .nutritionItems!.data![index1].nutritionData!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${NutritionCubit.get(context).nutritionItems!.data![index1].nutritionData![index].name}' ,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kThirdColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${NutritionCubit.get(context).nutritionItems!.data![index1].nutritionData?[index].value ?? 0} ' ,
                                        textAlign: TextAlign.center,

                                        style: TextStyle(
                                            color: kThirdColor,
                                            fontWeight: FontWeight.bold),
                                      ),


                                    ]),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  )
                ],
              ) : SizedBox();
            },
          )
        ],
      ),
    );
  }
}
