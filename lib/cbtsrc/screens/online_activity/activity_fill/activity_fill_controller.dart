import 'package:audioplayers/audioplayers.dart';
import 'package:digigyan/cbtsrc/screens/online_activity/activity_fill/activity_model.dart';
import 'package:digigyan/cbtsrc/screens/online_activity/activity_repo.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/vcb_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CbtFillController extends GetxController {
  var count = 0;

  RxList<ActivityModel> listActivity = <ActivityModel>[].obs;
  RxList<String> answers = <String>[].obs;
  RxString acceptedAnswer = "".obs;
  RxBool isRightAnswer = false.obs;
  RxBool isClick = false.obs;
  RxBool isChanged = false.obs;
  RxInt qCount = 0.obs;
  RxInt flashCount = 0.obs;

  @override
  void onInit() {
    // fetchActivityData();
  }

  Future<void> fetchActivityData(
      VcbTechModel vcbTechModel, int id, int chapterId) async {
    String apiUrl = 'http://deepuprakashan.com/school-api/activity-data';
    // String apiUrl = 'http://deepuprakashan.com/school-api/book-activity-data';

    // Define the request JSON body
    Map<String, dynamic> requestBody = {
      "PR_CATEGORY_ID": 1,
      "PR_BOOK_ID": vcbTechModel.data!.prBookId!,
      "PR_CHAPTER_ID": chapterId,
      "PR_ACTIVITY_TYPE_ID": id
    };

    try {
      listActivity.value = [];
      answers.clear();
      acceptedAnswer.value = "";
      isClick.value = false;
      isRightAnswer.value = false;
       CbtActivityRepo().getActivityData(
          param: requestBody,
          url: apiUrl,
          beforeSend: () {},
          onSuccess: (data) {
            if (data.isSuccess) {
              listActivity.value = data.resObject!;
              listActivity.forEach((element) {
                answers.add(element.prAnswer!);
              });
            }
          },
          onError: (error) {});
    } catch (error) {
      // Handle any exceptions that might occur during the request
      print('Error: $error');
    }
  }

  void setSelectedAnswer(String value, bool isAnswer) {
    isChanged.value = true;
    acceptedAnswer.value = value;
    isRightAnswer.value = isAnswer;

    if (isRightAnswer.value) {
      AudioPlayer().play(AssetSource('audio/right.mp3'));
    } else {
      AudioPlayer().play(AssetSource('audio/wrong.mp3'));
    }
    isChanged.value = false;
  }
}
