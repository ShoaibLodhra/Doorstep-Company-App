import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import '../ac/ac_detail_screen.dart';

class GeyserScreen extends StatefulWidget {
  const GeyserScreen({super.key});

  @override
  State<GeyserScreen> createState() => _GeyserScreenState();
}

class _GeyserScreenState extends State<GeyserScreen> {
  final List<bool> selectedFilters = List.generate(4, (index) => false);

  bool isLiked = false;
// Search controller
  final searchController = TextEditingController();
  // Sample filter categories
  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];

  void toggleFilter(int index) {
    setState(() {
      selectedFilters[index] = !selectedFilters[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.blueAccentColor,
          title: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.whiteTheme,
                  isDense: true,
                  hintText: 'Start searching..',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Badge.count(
                          count: selectedFilters.where((element) => element).length,
                          child: const Icon(Icons.filter_alt_rounded))),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final isSelected = selectedFilters[index];
                        return CustomContainer(
                            onTap: () => toggleFilter(index),
                            height: 40,
                            width: 140,
                            borderRadius: 40,
                            margin: const EdgeInsets.only(right: 8),
                            color: AppColors.transparentColor,
                            borderColor: isSelected ? AppColors.blueColor : AppColors.hintGrey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 6,
                              children: [
                                appText(
                                  categories[index],
                                  color: isSelected ? AppColors.blueColor : Colors.black,
                                ),
                                if (isSelected)
                                  IconButton(
                                      onPressed: () => toggleFilter(index),
                                      icon: const Icon(
                                        Icons.close,
                                        color: AppColors.blueColor,
                                        size: 20,
                                      ))
                              ],
                            ));
                      },
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AcDetailScreen(),
                          ),
                        );
                      } //else if{
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ProductDetailScreen(ac: ac),
                      //     ),
                      //   );
                      // }
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage('https://www.pngarts.com/files/18/Geyser-PNG-Photo-HQ.png')))),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      spacing: 4,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Super Heat Geyser', fontSize: 18, fontWeight: FontWeight.bold),
                                        Row(
                                          spacing: 10,
                                          children: [
                                            appText("Rs.50000", fontSize: 16, fontWeight: FontWeight.bold),
                                            appText("Rs.55000",
                                                decoration: TextDecoration.lineThrough,
                                                fontSize: 16,
                                                color: AppColors.hintGrey),
                                          ],
                                        ),
                                        appText("Model: SAM123IN", fontSize: 16),
                                        appText("Capacity: 1 ton", fontSize: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomContainer(
                                                borderRadius: 4.px,
                                                color: AppColors.greenColor,
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.px),
                                                  child: Row(
                                                    children: [
                                                      Image.asset('assets/images/delivery.png',
                                                          color: AppColors.whiteTheme, height: 26.px),
                                                      SizedBox(width: 4.px),
                                                      appText('Rs. 120',
                                                          color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                                    ],
                                                  ),
                                                )),
                                            CustomContainer(
                                                borderRadius: 4.px,
                                                color: AppColors.redColor,
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.px),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      appText('10% OFF',
                                                          color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                                                    ],
                                                  ),
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isLiked = !isLiked;
                                                  });
                                                },
                                                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline,
                                                    size: 28.px,
                                                    color: isLiked ? AppColors.redColor : AppColors.blackColor))
                                          ],
                                        )
                                      ],
                                    )))
                          ],
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
