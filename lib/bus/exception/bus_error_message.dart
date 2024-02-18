enum BusErrorMessage {
  notOK("버스를 찾지 못했습니다.");

  final String message;
  const BusErrorMessage(this.message);
}