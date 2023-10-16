//! Challenge 2: Widget Tree
// Flutter calls the nodes in its user-facing UI tree widgets. You can make a mini- version of the same thing.

// ignore_for_file: unused_local_variable

class Widget {}

class Column extends Widget {
  Column({this.children});
  List<Widget>? children;
}

class Padding extends Widget {
  Padding({this.value = 0.0, this.child});
  double value;
  Widget? child;
}

class Text extends Widget {
  Text([this.value = '']);
  String value;
}

void main() {
  final Widget tree = Column(
    children: [
      Padding(
        value: 8.0,
        child: Text('This'),
      ),
      Padding(
        value: 8.0,
        child: Text('is'),
      ),
      Column(
        children: [
          Text('my'),
          Text('widget'),
          Text('tree!'),
        ], 
      ),
    ], 
  );
}