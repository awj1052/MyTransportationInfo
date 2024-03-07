enum SubwayUDType {
  up(key: "upWays", number: 1),
  down(key: "downWays", number: 0);

  final String key;
  final int number;
  const SubwayUDType({required this.key, required this.number});
}