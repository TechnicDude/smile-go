import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/model/homebannerModel.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';

final List<String> imgList = [
  'https://mobisoftinfotech.com/resources/wp-content/uploads/2018/07/Banner-1.png',
  'https://www.riomed.com/wp-content/uploads/2021/11/blogpost.jpg',
  'https://www.accuhealthlabs.com/wp-content/uploads/2021/01/800-X-502_01.jpg',
];

class SliderScreen extends StatelessWidget {
  final List<BannerData>? bannerdata;
  const SliderScreen({Key? key, this.bannerdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(bannerdata!.length);

    return CarouselSlider.builder(
      itemCount: bannerdata!.length, //imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: () {},
          child: CachedNetworkImage(
            //imageUrl: imgList[itemIndex],
            imageUrl: APIURL.imageurl + bannerdata![itemIndex].image!,
            width: 100.w,
            fit: BoxFit.cover,
            placeholder: (context, url) => LoaderScreennew(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
    );
  }
}
