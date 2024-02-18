enum SubwayErrorMessage {
  notOK(message: "응답 받지 못했습니다.");

  final String message;
  const SubwayErrorMessage({required this.message});
}