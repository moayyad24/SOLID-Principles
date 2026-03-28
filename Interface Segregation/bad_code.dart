// FAT INTERFACE - Violates ISP by forcing clients to depend on methods they don't use
abstract class IMenu {
  List<String> getVegetarianItems();
  List<String> getNonVegetarianItems();
  List<String> getDrinkItems();
}

// Vegetarian menu forced to implement non-vegetarian and drink methods
class VegetarianMenu implements IMenu {
  @override
  List<String> getVegetarianItems() {
    return ["Vegetable Curry", "Paneer Tikka", "Salad"];
  }
  
  @override
  List<String> getNonVegetarianItems() {
    // Violation: Vegetarian restaurant shouldn't need to implement this
    throw UnimplementedError("Vegetarian restaurant doesn't serve non-veg items");
    // Or worse: return empty list which might confuse clients
  }
  
  @override
  List<String> getDrinkItems() {
    // Violation: Even if they serve drinks, this forces implementation
    return ["Water", "Juice"]; // But this might not be accurate
  }
}

// Non-vegetarian menu forced to implement vegetarian methods
class NonVegetarianMenu implements IMenu {
  @override
  List<String> getVegetarianItems() {
    // Violation: Non-veg restaurant forced to implement veg menu
    return ["Salad"]; // Might have limited veg options
  }
  
  @override
  List<String> getNonVegetarianItems() {
    return ["Chicken Curry", "Fish Fry", "Mutton Biryani"];
  }
  
  @override
  List<String> getDrinkItems() {
    return ["Water", "Soda"];
  }
}

// Full restaurant menu implements everything (this one is okay)
class FullRestaurantMenu implements IMenu {
  @override
  List<String> getVegetarianItems() {
    return ["Vegetable Curry", "Paneer Tikka", "Salad"];
  }
  
  @override
  List<String> getNonVegetarianItems() {
    return ["Chicken Curry", "Fish Fry", "Mutton Biryani"];
  }
  
  @override
  List<String> getDrinkItems() {
    return ["Water", "Soda", "Juice", "Beer"];
  }
}

// Problematic display method - depends on fat interface
class MenuDisplay {
  // This method depends on the entire IMenu interface
  // even though it only needs vegetarian items
  static void displayVegetarianMenu(IMenu menu) {
    print("Vegetarian Menu:");
    try {
      for (var item in menu.getVegetarianItems()) {
        print("- $item");
      }
    } catch (e) {
      print("Error: ${menu.runtimeType} doesn't properly support vegetarian menu");
    }
  }
  
  static void displayNonVegetarianMenu(IMenu menu) {
    print("Non-Vegetarian Menu:");
    try {
      for (var item in menu.getNonVegetarianItems()) {
        print("- $item");
      }
    } catch (e) {
      print("Error: ${menu.runtimeType} doesn't properly support non-vegetarian menu");
    }
  }
  
  static void displayDrinkMenu(IMenu menu) {
    print("Drinks Menu:");
    try {
      for (var item in menu.getDrinkItems()) {
        print("- $item");
      }
    } catch (e) {
      print("Error: ${menu.runtimeType} doesn't properly support drinks menu");
    }
  }
}

void main() {
  var vegMenu = VegetarianMenu();
  var nonVegMenu = NonVegetarianMenu();
  var fullMenu = FullRestaurantMenu();
  
  print("=== Problems with ISP Violation ===\n");
  
  print("Attempting to display vegetarian menu from vegetarian restaurant:");
  MenuDisplay.displayVegetarianMenu(vegMenu); // Works
  
  print("\nAttempting to display non-vegetarian menu from vegetarian restaurant:");
  MenuDisplay.displayNonVegetarianMenu(vegMenu); // Throws error or returns empty
  
  print("\nAttempting to display vegetarian menu from non-vegetarian restaurant:");
  MenuDisplay.displayVegetarianMenu(nonVegMenu); // Might return limited/incorrect items
  
  print("\n=== Issues ===");
  print("1. VegetarianMenu forced to implement methods it doesn't support");
  print("2. NonVegetarianMenu forced to implement vegetarian methods");
  print("3. Clients depend on methods they don't use");
  print("4. Runtime errors or incorrect data due to forced implementations");
  print("5. Changes to IMenu affect all implementing classes unnecessarily");
}