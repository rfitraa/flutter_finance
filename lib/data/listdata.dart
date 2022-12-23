import '1.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = 'Upwork';
  upwork.fee = '650';
  upwork.time = 'Today';
  upwork.image = 'Money.png';
  upwork.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '15';
  starbucks.image = 'Food.png';
  starbucks.name = 'Starbucks';
  starbucks.time = 'Today';
  money trasfer = money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'Transfer.png';
  trasfer.name = 'Transfer to Tata';
  trasfer.time = 'Jan 30,2022';
  return [upwork, starbucks, trasfer, upwork, starbucks, trasfer];
}
