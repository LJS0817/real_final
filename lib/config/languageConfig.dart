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

  static const Set<String> text = {
    "레시피 이름",
    "값 설정",
    "다음",
    "이전",
    "저장하기",
    "나가기",
    "오일 선택",
    "확인",

    "Recipe Name",
    "Set Value",
    "Next",
    "Previous",
    "Save",
    "Quit",
    "Select Oil",
    "Done",
  };

  static const Set<String> soapText = {
    "오일",
    "슈퍼펫",
    "첨가물",
    "총량",

    "C.P형 비누",
    "H.P형 비누",
    "연비누",
    "비누 유형",

    "Lye 순도",
    "희망 Lye",
    "정제수",
    "순비누",
    "용제",
    "에탄올",
    "글리세린",
    "설탕",

    "추가한 오일",
    "추가한 슈퍼팻",
    "추가한 첨가물",
    "메모",
    "없음",





    "Oil",
    "SuperFat",
    "Additives",
    "Total",

    "C.P",
    "H.P",
    "Paste",
    "Soap Type",

    "Lye Purity",
    "Lye Count",
    "Water",
    "Pure Soap",
    "Solvent",
    "Ethanol",
    "Glycerine",
    "Sugar",

    "Selected Oil",
    "Selected Superfat",
    "Selected Additives",
    "Memo",

    "Empty",

  };

  static const Set<String> beautyText = {
    "스킨",
    "로션",
    "에센스",
    "크림",
    "기타",
    "화장품 유형",

    "민감성 피부",
    "건성",
    "아토피 피부",
    "중복합성 피부",
    "지성",
    "여드름 피부",
    "피부 유형",

    "총 용량",
    "수상츨 %",
    "유상층 %",
    "유화제 %",

    "Skin",
    "Lotion",
    "Essence",
    "Cream",
    "Others",
    "Beauty Type",

    "Sensitive Skin",
    "Dry Skin",
    "Atopic Skin",
    "Mixed Skin",
    "Oily Skin",
    "Acne Skin",
    "Skin Type",

    "Total Weight",
    "Water %",
    "Oil %",
    "Emulsifier"
  };

  void init() {
    isKorean = Platform.localeName.contains("ko") ? false : true;
  }

  String getMainTitle(int index) {
    return mainTitle.elementAt(index + getIndex(mainTitle.length));
  }

  String getText(int index) {
    return text.elementAt(index + getIndex(text.length));
  }

  String getSoapText(int index) {
    return soapText.elementAt(index + getIndex(soapText.length));
  }

  String getBeautyText(int index) {
    return beautyText.elementAt(index + getIndex(beautyText.length));
  }

  int getIndex(int length) {
    return isKorean ? (length / 2).floor() : 0;
  }
}