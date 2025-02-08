import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_text.dart';
import '../../constants/colors.dart';
import '../../utils/bottom_navigation_screen.dart';

class FetchedLocationScreen extends StatefulWidget {
  final double? latitude;
  final double? longitude;

  const FetchedLocationScreen({super.key, this.latitude, this.longitude});

  @override
  State<FetchedLocationScreen> createState() => _FetchedLocationScreenState();
}

class _FetchedLocationScreenState extends State<FetchedLocationScreen> {
  String? address;
  String? city;
  bool isLoading = true;

  Future<void> fetchLocation() async {
    try {
      double latitude = widget.latitude ?? 0.0;
      double longitude = widget.longitude ?? 0.0;

      if (latitude == 0.0 || longitude == 0.0) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        latitude = position.latitude;
        longitude = position.longitude;
      }

      await getAddressFromLatLng(latitude, longitude);

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(BottomNavigationScreen(
          latitude: latitude,
          longitude: longitude,
        ));
      });
    } catch (e) {
      setState(() {
        address = 'Unable to fetch location';
        city = 'Unknown location';
        isLoading = false;
      });
    }
  }

  /// Get address details from latitude and longitude
  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
          city = '${place.locality}, ${place.country}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        address = 'Unable to fetch address';
        city = 'Unknown location';
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 34.px,
            width: 34.px,
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.darkGreen),
            child: isLoading ? const SizedBox() : const Icon(Icons.check, color: AppColors.whiteTheme)),
        Container(height: 30.px, width: 2.px, color: AppColors.darkGreen),
        appText('Delivering services at', color: AppColors.darkGreen),
        SizedBox(height: 8.px),
        isLoading
            ? appText('Fetching your location! Please wait', fontSize: 16.px)
            : appText('$city', fontWeight: FontWeight.w600, fontSize: 16),
        SizedBox(height: 8.px),
        Center(
            child: appText(isLoading ? 'Fetching location...' : address ?? 'No address available',
                maxLines: 2,
                fontSize: 16.px,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
                color: AppColors.hintGrey)),
      ],
    )));
  }
}
