import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../../../components/divider.dart';
import '../../../constants/colors.dart';
import 'spa_for_women_screen.dart';

class SpaForWomenCategoryScreen extends StatelessWidget {
  const SpaForWomenCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Spa for Women', fontSize: 20, fontWeight: FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.px),
            appText('Select your preference', fontSize: 22, fontWeight: FontWeight.bold),
            SizedBox(height: 20.px),
            div(),
            SizedBox(height: 20.px),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SpaForWomenScreen()));
              },
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            height: 90.px,
                            width: 90.px,
                            borderRadius: 8,
                            color: AppColors.grey300.withOpacity(0.3),
                            image: const DecorationImage(
                              image: NetworkImage('https://www.wnbspa.in/wp-content/uploads/2019/09/gallery-1.png'),
                              fit: BoxFit.cover,
                            ),
                            child: const SizedBox(),
                          ),
                          SizedBox(width: 16.px),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText('Prime', fontSize: 18, fontWeight: FontWeight.bold),
                                SizedBox(height: 10.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: appText(
                                        'Certified therapist & \nessential oils',
                                        fontSize: 16,
                                        color: AppColors.hintGrey,
                                      ),
                                    ),
                                    Icon(Icons.chevron_right, color: AppColors.hintGrey),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      div()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
