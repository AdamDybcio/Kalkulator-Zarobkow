class Data {
  final String date;
  final int hours;
  final double rate;

  Data({required this.date, required this.hours, required this.rate});

  Data.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        hours = json['hours'],
        rate = json['rate'];

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'hours': hours,
      'rate': rate,
    };
  }
}
