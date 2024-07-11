import 'abstract_dim_list.dart';

class DimensionalList<T> implements AbstractDimensionalList {
  int dimensions;
  // the list which the values will be stored in
  late List _list;

  // constructors use initializer list to initilize data members

  /// creates an empty growable one dimensional List<T>, where T is the parameterized generic passed in creation
  DimensionalList.oneDimensional()
      : dimensions = 1,
        _list = List<T>.empty(growable: true);

  /// creates an empty growable two dimensional List<T>, where T is the parameterized generic passed in creation

  DimensionalList.twoDimensional()
      : dimensions = 2,
        _list = List<List<T>>.empty(growable: true);

  /// creates an empty growable three dimensional List<T>, where T is the parameterized generic passed in creation
  DimensionalList.threeDimensional()
      : dimensions = 3,
        _list = List<List<List<T>>>.empty(growable: true);

  /// adds an element to the existing list
  /// You must pass the correct element to add according to the Number of dimensions that the list is
  /// For example: list = [1,2,3]
  /// addElement(4) list = [1,2,3,4]
  /// But list = [[1,2],[3,4]]
  /// addElement([5,6])
  /// list = [[1,2],[3,4], [5,6]],
  /// according to the number of dims you have created that list, otherwise an exception will be thrown
  @override
  void addElement(element) {
    // dynamic can be ommitted
    if (dimensions == 1 && element is List) {
      // can't nest lists within a one dimension list
      throw 'You can not add a list as element within a unary dimensional list';
    }
    if (dimensions == 2 && element is! List) {
      // in N dim lists, elements are just another encasulated lists
      throw 'the element must be a List';
    }

    if (dimensions == 3 && element is! List<List>) {
      throw 'element in 3rd dimensional list is a layer (List<List>)';
    }
    _list.add(element);
  }

  /// searches for the passed element and pass it
  /// the passed element should be reasonable, as mentioned before in addElement
  /// you can not delete a list form one dimension list
  /// ForExample: list = [1,2]
  /// removerElement(2)
  /// will result in, list = [1], otherwise a Not Found message prompt will be displayed
  @override
  void removeElement(element) {
    if (dimensions == 1 && element is List) {
      throw 'Not Found';
    }
    if (dimensions == 2 && element is! List) {
      throw 'Not Found';
    }
    if (dimensions == 3 && element is! List<List>) {
      throw 'Not Found';
    }

    // lists are references, they are not compared based on value, just reference comparison
    //so, we must search for that value and delete it if it exists
    if (dimensions == 1) {
      // has no effect on nested lists (N dimension lists)
      _list.remove(element);
    } else {
      handleNestedListRemove(element);
    }
  }

  void handleNestedListRemove(element) {
    // searches for that list within a 2 dim list and deletes it if found,
    // until now, three dimensional list deletion is not implemented, but it will be commited as soon as possible
    if (dimensions == 2) {
      int foundIndex = -1;

      for (int row = 0; row < _list.length; row++) {
        bool found = true;
        for (int col = 0; col < _list[row].length; col++) {
          if (element.length != _list[row].length) {
            break;
          }
          if (_list[row][col] != element[col]) {
            found = false;
          }
          if (found) {
            foundIndex = row;
            break;
          }
        }
      }
      if (foundIndex >= 0) {
        _list.remove(_list[foundIndex]);
      }
    }
  }

  /// just prints each element within that list, weather it's 1 or N dimensional
  @override
  void printList() {
    for (var item in _list) {
      print(item);
    }
  }
}
