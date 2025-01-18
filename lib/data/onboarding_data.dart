import 'package:expenz/models/onboarding_model.dart';

class OnboardingData {
  static final List<Onboarding> onboardingDataList = [
    Onboarding(
      title: "Gain total control of your money",
      ImagePath:
          "https://cdn.pixabay.com/photo/2016/06/13/15/07/presentation-1454403_640.png",
      Description: "Become your own money manager and make every cent count",
    ),
    Onboarding(
      title: "Know where your money goes",
      ImagePath:
          "https://cdn.pixabay.com/photo/2019/11/23/09/25/marketing-4646598_640.png",
      Description:
          "Track your transaction easily, with categories and financial report",
    ),
    Onboarding(
      title: "Planning ahead",
      ImagePath:
          "https://cdn.pixabay.com/photo/2012/05/07/11/10/idea-48100_640.png",
      Description: "Setup your budget for each category so you in control",
    )
  ];
}
