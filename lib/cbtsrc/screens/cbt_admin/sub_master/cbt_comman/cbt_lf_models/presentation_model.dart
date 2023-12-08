class SimulationModel {
  SimulationModel({
    required this.prSimulationId,
    required this.prName,
    required this.prUrl,
    this.prSimulationFile,
    this.prDescription,
    required this.prStatus,
    required this.prCreatedAt,
    required this.prModifiedAt,
  });

  int prSimulationId;
  String prName;
  String prUrl;
  dynamic prSimulationFile;
  dynamic prDescription;
  int prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;

  factory SimulationModel.fromJson(Map<String, dynamic> json) =>
      SimulationModel(
        prSimulationId: json["PR_SIMULATION_ID"] ?? 0,
        prName: json["PR_NAME"] ?? "",
        prUrl: json["PR_URL"] ?? "",
        prSimulationFile: json["PR_SIMULATION_FILE"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"] ?? "",
        prModifiedAt: json["PR_MODIFIED_AT"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_SIMULATION_ID": prSimulationId,
        "PR_NAME": prName,
        "PR_URL": prUrl,
        "PR_SIMULATION_FILE": prSimulationFile,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt.toIso8601String(),
      };
}
