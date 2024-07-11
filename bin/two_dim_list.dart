import 'dim_list.dart';

void main() {
  DimensionalList<int> list = DimensionalList.twoDimensional();
  list.addElement([1, 2]);
  list.addElement([3, 4]);

  list.removeElement([3, 4]);
  list.printList();
}
