enum SubwayUDType {
  up(key: "upWays", number: 0),
  down(key: "downWays", number: 1);

  final String key;
  final int number;
  const SubwayUDType({required this.key, required this.number});
}