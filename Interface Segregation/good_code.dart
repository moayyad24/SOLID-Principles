// Interface for vegetarian menu
abstract class IVegetarianMenu {
  List<String> getVegetarianItems();
}

// Interface for non-vegetarian menu
abstract class INonVegetarianMenu {
  List<String> getNonVegetarianItems();
}

// Interface for drinks menu
abstract class IDrinkMenu {
  List<String> getDrinkItems();
}

// Class for vegetarian menu
class VegetarianMenu implements IVegetarianMenu {
  @override
  List<String> getVegetarianItems() {
    return ["Vegetable Curry", "Paneer Tikka", "Salad"];
  }
}

// Class for non-vegetarian menu
class NonVegetarianMenu implements INonVegetarianMenu {
  @override
  List<String> getNonVegetarianItems() {
    return ["Chicken Curry", "Fish Fry", "Mutton Biryani"];
  }
}

// Class for drinks menu
class DrinkMenu implements IDrinkMenu {
  @override
  List<String> getDrinkItems() {
    return ["Water", "Soda", "Juice"];
  }
}

// Menu display class with specific interfaces
class MenuDisplay {
  static void displayVegetarianMenu(IVegetarianMenu menu) {
    print("Vegetarian Menu:");
    for (var item in menu.getVegetarianItems()) {
      print("- $item");
    }
  }

  static void displayNonVegetarianMenu(INonVegetarianMenu menu) {
    print("Non-Vegetarian Menu:");
    for (var item in menu.getNonVegetarianItems()) {
      print("- $item");
    }
  }
  
  static void displayDrinkMenu(IDrinkMenu menu) {
    print("Drinks Menu:");
    for (var item in menu.getDrinkItems()) {
      print("- $item");
    }
  }
}

void main() {
  var vegMenu = VegetarianMenu();
  var nonVegMenu = NonVegetarianMenu();
  var drinkMenu = DrinkMenu();

  MenuDisplay.displayVegetarianMenu(vegMenu);
  MenuDisplay.displayNonVegetarianMenu(nonVegMenu);
  MenuDisplay.displayDrinkMenu(drinkMenu);
}