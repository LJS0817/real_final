import 'dart:io';

final Words words = Words();

class Words {
  bool isKorean = false;
  static const Set<String> mainTitle = {
    "비누 레시피",
    "화장품 레시피",
    "오일 목록",
    "설정",

    "Soap List",
    "Beauty List",
    "Oil List",
    "Settings",
  };

  static const Set<String> soapText = {
    "오일",
    "슈퍼펫",
    "첨가물",
    "총량",

    "C.P형 비누",
    "H.P형 비누",
    "연비누",




    "Oil",
    "SuperFat",
    "Additives",
    "Total",

    "C.P",
    "H.P",
    "Paste",
  };

  static const Set<String> beautyText = {
    "스킨",
    "로션",
    "에센스",
    "크림",



    "Skin",
    "Lotion",
    "Essence",
    "Cream"
  };

  void init() {
    isKorean = Platform.localeName.contains("ko") ? false : true;
  }

  String getMainTitle(int index) {
    return mainTitle.elementAt(index + getIndex(mainTitle.length));
  }

  String getSoapText(int index) {
    return soapText.elementAt(index + getIndex(soapText.length));
  }

  String getBeautyType(int index) {
    return beautyText.elementAt(index + getIndex(beautyText.length));
  }

  int getIndex(int length) {
    return isKorean ? (length / 2).floor() : 0;
  }
}