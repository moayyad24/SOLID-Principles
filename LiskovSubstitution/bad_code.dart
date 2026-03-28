// Base class for shapes
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  double area() {
    return width * height;
  }
  
  double getWidth() => width;
  double getHeight() => height;
  
  void setWidth(double w) {
    width = w;
  }
  
  void setHeight(double h) {
    height = h;
  }
}

// Derived class for squares - VIOLATES LSP
class Square extends Rectangle {
  Square(double size) : super(size, size);
  
  @override
  void setWidth(double w) {
    width = height = w; // Breaks the expected behavior
  }
  
  @override
  void setHeight(double h) {
    width = height = h; // Breaks the expected behavior
  }
}

void testRectangle(Rectangle rect) {
  // This test assumes Rectangle behavior
  rect.setWidth(5);
  rect.setHeight(4);
  
  // Expecting width=5, height=4, area=20
  print("Width: ${rect.getWidth()}, Height: ${rect.getHeight()}");
  print("Area: ${rect.area()}");
  print("Expected area: 20");
  print("---");
}

void main() {
  Rectangle rectangle = Rectangle(0, 0);
  print("Testing Rectangle:");
  testRectangle(rectangle); // Works as expected
  
  Rectangle square = Square(0);
  print("Testing Square as Rectangle:");
  testRectangle(square); // FAILS - produces different behavior!
  
  // This violates LSP because a Square cannot be substituted for a Rectangle
  // without changing the program's correctness
}