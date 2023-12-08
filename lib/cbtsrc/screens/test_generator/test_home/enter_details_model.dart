class TestGeneratorModel {
  TestDatails testDatails;
  TestGeneratorModel({required this.testDatails});
}

class TestDatails {
  String testName;
  String testDuuration;
  String testMode;
  String testType;
  String image;

  TestDatails({
    this.testName = "",
    this.testDuuration = "00:00",
    this.testMode = "",
    this.testType = "",
    this.image = "",
  });
}





