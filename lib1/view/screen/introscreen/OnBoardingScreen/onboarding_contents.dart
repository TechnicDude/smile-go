import 'package:smile_and_go_app/utils/appimages.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Thousands of  doctors & experts to help your health!",
    image: AppImages.onboardingfirst,
    desc:
        "Publish up your selfies to make yoursef \nmore beautiful with this app.",
  ),
  OnboardingContents(
    title: "Health checks & consultations easily anywhere anytime",
    image: AppImages.onboardingsec,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Let’s start living healthy and well with us right now!",
    image: AppImages.onboardingthree,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
