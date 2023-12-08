class TopicModel {
  TopicModel({
    required this.prTopicId,
    // required this.prBook,
    required this.prName,
    required this.prTopicFile,
    required this.prDescription,
    required this.prStatus,
    required this.prCreatedAt,
    required this.prModifiedAt,
    required this.pdfCount,
    required this.videoCount,
    required this.prSimulationCount,
  });

  int prTopicId;
  // BookModel prBook;
  String prName;
  String prTopicFile;
  String prDescription;
  int prStatus;
  int prSimulationCount;
  int videoCount;
  int pdfCount;
  dynamic prCreatedAt;
  dynamic prModifiedAt;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        prTopicId: json["PR_TOPIC_ID"] ?? 0,
        // prBook: BookModel.fromJson(json["PR_BOOK"]),
        prName: json["PR_NAME"] ?? "",
        prTopicFile: json["PR_TOPIC_FILE"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prSimulationCount: json["PR_SIMULATION_COUNT"] ?? 0,
        videoCount: json["PR_VIDEO_COUNT"] ?? 0,
        pdfCount: json["PR_PDF_COUNT"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"] ?? "",
        prModifiedAt: json["PR_MODIFIED_AT"] ?? "",
      );



  Map<String, dynamic> toJson() => {
        "PR_TOPIC_ID": prTopicId,
        // "PR_BOOK": prBook.toJson(),
        "PR_NAME": prName,
        "PR_TOPIC_FILE": prTopicFile,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt.toIso8601String(),
      };
}
