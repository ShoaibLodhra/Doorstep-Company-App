import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/divider.dart';
import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/app_text.dart';
import '../chat/chat_screen.dart';
import 'approve_disapprove_screen.dart';
import 'user_detail_screen.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  int activeStep = 0;
  double progress = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('Booking Details', fontSize: 18.px, fontWeight: FontWeight.w400)),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 6.px),
              appText('Booking # 1000283', fontSize: 18.px, fontWeight: FontWeight.w400, color: AppColors.blueColor),
              const Divider(),
              // div(),
              Row(
                spacing: 20.px,
                children: [
                  Container(
                      height: 70.px,
                      width: 70.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/mixergrinder.jpeg'), fit: BoxFit.cover))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Bathroom & kitchen\ncleaning', fontSize: 16.px, fontWeight: FontWeight.w400),
                      SizedBox(height: 6.px),
                      appText('2x services', color: AppColors.greyColor, fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.px),
              const Divider(),
              SizedBox(height: 10.px),
              Row(
                spacing: 4.px,
                children: [
                  appText('Customer : ', fontSize: 16.px, fontWeight: FontWeight.w400),
                  appText(' Ali Ahmad', fontSize: 18.px, fontWeight: FontWeight.w400),
                  const Spacer(),
                  appText('REPEAT ', color: AppColors.greenColor, fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(height: 10.px),
              bookingRow(text1: 'Booking Date', text2: '12 Feb 2045'),
              SizedBox(height: 6.px),
              bookingRow(text1: 'Service Date', text2: '12 Feb 2045'),
              SizedBox(height: 6.px),
              appText('Bosan Road, Near Ideal Mall, Sabzazar\ncolony, Multan, Punjab',
                  fontSize: 16.px, color: AppColors.hintGrey),
              SizedBox(height: 20.px),
              div(),
              SizedBox(height: 10.px),
              appText('Status', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  stepWidget('Accepted', activeStep >= 0),
                  stepConnector(activeStep >= 0),
                  stepWidget('Assigned', activeStep >= 1),
                  stepConnector(activeStep >= 1),
                  stepWidget('Working', activeStep >= 2),
                  stepConnector(activeStep >= 2),
                  stepWidget('Completed', activeStep >= 3),
                ],
              ),
              const Divider(),
              SizedBox(height: 10.px),
              appText('Payment Method', fontWeight: FontWeight.bold, fontSize: 20.px),
              SizedBox(height: 10.px),
              Row(
                spacing: 4,
                children: [
                  appText('Cash after service', color: AppColors.hintGrey),
                  const Spacer(),
                  appText('Payment Status:', color: AppColors.hintGrey),
                  CustomContainer(
                      height: 30.px,
                      width: 76.px,
                      borderRadius: 6.px,
                      color: AppColors.redColor,
                      child: Center(child: appText('Unpaid', color: AppColors.whiteTheme, fontWeight: FontWeight.w400)))
                ],
              ),
              appText('Amount : Rs. 47627', fontWeight: FontWeight.bold, fontSize: 16.px),
              SizedBox(height: 10.px),
              div(),
              SizedBox(height: 10.px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText('Professional', fontSize: 20.px, fontWeight: FontWeight.bold),
                  SizedBox(height: 10.px),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDetailScreen()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.px,
                      children: [
                        CircleAvatar(
                            radius: 40.px,
                            backgroundImage: const NetworkImage(
                                'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewperformance1-697509.jpg&fm=jpg')),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: appText('Muzammil Amjad', fontSize: 16.px, fontWeight: FontWeight.bold)),
                                CustomContainer(
                                    color: AppColors.blueColor,
                                    borderRadius: 8.px,
                                    child: Padding(
                                        padding: EdgeInsets.all(6.px),
                                        child: Center(
                                            child: appText('Assigned',
                                                color: AppColors.whiteTheme,
                                                fontSize: 16.px,
                                                fontWeight: FontWeight.w400)))),
                              ],
                            ),
                            Row(
                              spacing: 6.px,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.px,
                                  color: AppColors.hintGrey,
                                ),
                                appText('4.86',
                                    fontSize: 16.px, fontWeight: FontWeight.w400, color: AppColors.hintGrey),
                              ],
                            ),
                            SizedBox(height: 4.px),
                            Row(
                              children: [appText('Completed jobs: 15', fontSize: 16.px, fontWeight: FontWeight.w400)],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                          width: 100.px,
                          borderRadius: 8.px,
                          color: AppColors.transparentColor,
                          borderColor: AppColors.blackColor,
                          child: Padding(
                            padding: EdgeInsets.all(4.px),
                            child: Row(
                              spacing: 4.px,
                              children: [
                                Image.asset('assets/images/checkmark.png', height: 22.px, color: AppColors.greenColor),
                                appText('Verified',
                                    color: AppColors.greenColor, fontSize: 16.px, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )),
                      Row(
                        spacing: 20.px,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: Image.asset('assets/images/chat.png',
                                      height: 22.px, color: AppColors.blueColor))),
                          GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: const Icon(Icons.call, color: AppColors.blueColor))),
                          GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: AppColors.grey300.withOpacity(0.5),
                                  child: const Icon(Icons.place_outlined, color: AppColors.blueColor))),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.px),
              div(),
              SizedBox(height: 10.px),
              appText('Booking Summary', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Service Info', fontSize: 18.px),
                  appText('Service Cost', fontSize: 18.px),
                ],
              ),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Bridal Makeover', fontSize: 16.px, fontWeight: FontWeight.w400),
                  appText('Rs. 40,000', fontSize: 16.px, fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(height: 6.px),
              appText('Wedding Receptionist makeover', color: AppColors.hintGrey, fontSize: 16.px),
              SizedBox(height: 6.px),
              appText('Unit price: Rs.30,000', color: AppColors.hintGrey, fontSize: 16.px), SizedBox(height: 6.px),
              appText('Quantity: 1', color: AppColors.hintGrey, fontSize: 16.px),
              SizedBox(height: 6.px),
              appText('Campaign: Rs. 746743', color: AppColors.hintGrey, fontSize: 16.px),
              SizedBox(height: 6.px),
              appText('Coupons: Rs. 746743', color: AppColors.hintGrey, fontSize: 16.px),
              SizedBox(height: 10.px),
              const Divider(),
              SizedBox(height: 6.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('SubTotal', fontSize: 20.px),
                  appText('Rs. 1900', fontSize: 20.px),
                ],
              ),
              SizedBox(height: 6.px),
              subTotalRow(text1: 'Service discount', text2: '(-) Rs. 0.00'),
              SizedBox(height: 6.px),
              subTotalRow(text1: 'Coupon discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 6.px),
              subTotalRow(text1: 'Campaign discount', text2: '(-) Rs. 499.00'),
              SizedBox(height: 6.px),
              subTotalRow(text1: 'Service VAT', text2: '(+) Rs. 499.00'),
              SizedBox(height: 6.px),
              subTotalRow(text1: 'Platform charge', text2: '(+) Rs. 499.00'),
              SizedBox(height: 10.px),
              const Divider(),
              SizedBox(height: 10.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText('Grand Total', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 18.px),
                  appText('Rs. 49,000', color: AppColors.blueShade, fontWeight: FontWeight.bold, fontSize: 18.px),
                ],
              ),
              SizedBox(height: 20.px),
              CustomContainer(
                  height: 34.px,
                  width: 140.px,
                  borderColor: AppColors.lowPurple,
                  color: AppColors.transparentColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      appText('Verified By DC'),
                      Icon(Icons.check_circle, color: AppColors.greenColor, size: 16.px)
                    ],
                  )),
              SizedBox(height: 20.px)
            ]))));
  }
}
