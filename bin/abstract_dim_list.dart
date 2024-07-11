abstract interface class AbstractDimensionalList {
  void addElement(dynamic element);
  void removeElement(dynamic element);
  void printList();
}

//            Constructed   Extended   Implemented    Mixed
// abstract :     No         Yes         Yes           Yes
// interface:     Yes         No         Yes           Yes 
// mixin :        No          Yes        Yes           Yes
// final:         Yes         No         No            No
// base:          Yes         Yes        No            Yes
// sealed:        No          Yes        Yes           Yes  (if and only if subtypes are located in the same dart library)  

/*


 */

