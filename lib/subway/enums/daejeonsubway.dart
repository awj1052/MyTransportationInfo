enum DaejeonSubway {

  panam(name: "판암", station: 30101),
  sinheung(name: "신흥", station: 30102),
  daeDong(name: "대동", station: 30103),
  daejeon(name: "대전", station: 30104),
  jungangno(name: "중앙로", station: 30105),
  jungguOffice(name: "중구청", station: 30106),
  seodaejeonnegeori(name: "서대전네거리", station: 30107),
  oryong(name: "오룡", station: 30108),
  yongmun(name: "용문", station: 30109),
  tanbang(name: "탄방", station: 30110),
  cityHall(name: "시청", station: 30111),
  govermentComplex(name: "정부청사", station: 30112),
  galma(name: "갈마", station: 30113),
  wolpyeong(name: "월평", station: 30114),
  gapcheon(name: "갑천", station: 30115),
  yuseongSpa(name: "유성온천", station: 30116),
  guam(name: "구암", station: 30117),
  nationalCemetery(name: "현충원", station: 30118),
  worldCupStadium(name: "월드컵경기장", station: 30119),
  noeun(name: "노은", station: 30120),
  jijok(name: "지족", station: 30121),
  banseok(name: "반석", station: 30122);

  final String name;
  final int station;
  const DaejeonSubway({required this.name, required this.station});
}