// Abstract base class for shapes
abstract class Shape {
  double area();
}

// Rectangle class
class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
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

// Square class - independent, not inheriting from Rectangle
class Square implements Shape {
  double side;

  Square(this.side);

  @override
  double area() {
    return side * side;
  }

  double getSide() => side;

  void setSide(double s) {
    side = s;
  }
}

// Alternative approach using a more flexible design
abstract class Quadrilateral implements Shape {
  // Common properties for quadrilaterals
}

// Or using a composition approach
class BetterSquare implements Shape {
  Rectangle _rectangle;

  BetterSquare(double side) : _rectangle = Rectangle(side, side);

  @override
  double area() => _rectangle.area();

  double getSide() => _rectangle.getWidth();

  void setSide(double side) {
    _rectangle.setWidth(side);
    _rectangle.setHeight(side);
  }
}

void testShape(Shape shape) {
  // Test that works for any shape
  print("Area: ${shape.area()}");
}

void main() {
  Rectangle rectangle = Rectangle(5, 4);
  Square square = Square(4);
  BetterSquare betterSquare = BetterSquare(4);

  print("Testing Rectangle:");
  print("Area: ${rectangle.area()}"); // 20

  print("\nTesting Square:");
  print("Area: ${square.area()}"); // 16

  print("\nTesting BetterSquare:");
  print("Area: ${betterSquare.area()}"); // 16

  // Both can be used polymorphically
  List<Shape> shapes = [rectangle, square, betterSquare];
  print("\nPolymorphic test:");
  for (var shape in shapes) {
    testShape(shape);
  }
}
