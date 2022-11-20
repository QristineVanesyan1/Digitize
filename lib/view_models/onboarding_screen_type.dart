enum OnBoardingScreenType { productivity, organized, aligned }

extension OnBoardingScreenTypeExtension on OnBoardingScreenType {
  String getTitle() {
    switch (this) {
      case OnBoardingScreenType.productivity:
        return 'Scan Images Fast & Easy';
      case OnBoardingScreenType.organized:
        return 'ffffffffffffffffffff';
      case OnBoardingScreenType.aligned:
        return 'Copy, share and export to pdf or document format';
    }
  }

  String getImagePath() {
    switch (this) {
      case OnBoardingScreenType.productivity:
        return 'assets/images/img_onboarding1.PNG';
      case OnBoardingScreenType.organized:
        return 'assets/images/img_onboarding1.PNG';
      case OnBoardingScreenType.aligned:
        return 'assets/images/img_onboarding3.PNG';
    }
  }

  String getText() {
    switch (this) {
      case OnBoardingScreenType.productivity:
        return 'Turn your photographs of text or pdf files into an editable and searchable text with just a few clicks';
      case OnBoardingScreenType.organized:
        return 'fffffffffffffffffffffffff';
      case OnBoardingScreenType.aligned:
        return 'It\'s easy to share or export to pdf or doc format without the need to copying and pasting to external word processing program.';
    }
  }
}
