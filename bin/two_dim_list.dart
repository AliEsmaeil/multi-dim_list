import 'abstract_dim_list.dart';
import 'dim_list.dart';

void main() {
  AbstractDimensionalList list = DimensionalList<int>.twoDimensional();
  list.addElement([1, 2]);
  list.addElement([3, 4]);

  list.removeElement([3, 4]);
  list.printList();
}
