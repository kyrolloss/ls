import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:ls/Featrue/MainLayout/view/Vitamins%20Features/Model%20View/vitamin_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

class VitaminDetails extends StatefulWidget {
  const VitaminDetails({super.key});

  @override
  State<VitaminDetails> createState() => _VitaminDetailsState();
}

class _VitaminDetailsState extends State<VitaminDetails> {

  @override
  void deactivate() {
    VitaminScreenCubit.get(context).specificVitamin = null;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<VitaminScreenCubit, VitaminScreenState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return VitaminScreenCubit.get(context)
        .specificVitamin != null ?Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 50,
          title: Text(
            VitaminScreenCubit.get(context)
                .specificVitamin!.data!.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: width * .05,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: width,
                height: height * .7,
                child: VimeoPlayer(
                    videoId: VitaminScreenCubit.get(context)
                        .specificVitamin!
                        .data
                        .video
                        .publicId.toString())),
            SizedBox(
              height: height * .025,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        VitaminScreenCubit.get(context).specificVitamin!.data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: height * .015,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * .075,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    VitaminScreenCubit.get(context).specificVitamin!.data.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * .04,
                    ),
                  ),
                  SizedBox(
                    height: height * .035,
                  ),
                  Image(image: NetworkImage(
                    VitaminScreenCubit.get(context).specificVitamin!.data.image,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ): Center(
      child: MyLoadingIndicator(height: height*.3, color: Colors.red),
    )  ;
  },
);
  }
}
