import '1.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.time = 'Jan 30,2022';
  snap_food.image = 'Food.png';
  snap_food.buy = true;
  snap_food.fee = '- Rp 100.000';
  snap_food.name = 'Mc Donalds';
  money snap = money();
  snap.image = 'Transfer.png';
  snap.time = 'Today';
  snap.buy = true;
  snap.name = 'Transfer';
  snap.fee = '- Rp 60.000';

  return [snap_food, snap];
}
