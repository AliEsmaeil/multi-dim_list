### Multi Dimensional List Demonstration in dart
This class *module* can be used to establish a one dimensional list , two or even three dimensional list.

Unitl now, the class supports the whole operations of one, two dimensional list but the third dimensioanl list's remove operation is not supported yet.

that's because **lists are treated and compared according to reference rather than values**.

_______________________________________________________________

#### Note
- It's preferable to use abstraction layers to hide concrete implementation detials, so the `AbstractDimensionalList` `abstract` layer is used to conform to Dependency inversion principle (DIP).

- The concrete class itself is parameterized genric, you can optionally pass the data type of the element that will be stored within the list, either it's `int`, `double`,...etc.

- Parametrized generic type can be ommited, but it will be treated as `dynamic`, so you can store different data types within the same list, it becomes `List<dynamic>`.

#### Coming Updates

will involve the implementation of the `remove` operation of the three dimensional lists.
