class PlayerStatistic {
  late int win;
  late int lose;
  late double percent;

  PlayerStatistic({required this.win, required this.lose}) {
    _percentCalc();
  }

  PlayerStatistic.fromJson(Map<String, dynamic> json) {
    win = json['win'];
    lose = json['lose'];
    _percentCalc();
  }

  _percentCalc() {
    percent = (win / (win + lose)) * 100;
  }
}