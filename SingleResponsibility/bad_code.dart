// BAD: This class has too many responsibilities
class Bakery {
  String name;
  
  Bakery(this.name);
  
  // Responsibility 1: Baking
  void bakeBread() {
    print('Baking bread...');
    // Bread baking logic
  }
  
  void bakePastry() {
    print('Baking pastry...');
    // Pastry baking logic
  }
  
  // Responsibility 2: Inventory management
  void checkInventory() {
    print('Checking inventory levels...');
    // Inventory checking logic
  }
  
  void orderSupplies() {
    print('Ordering new supplies...');
    // Supply ordering logic
  }
  
  // Responsibility 3: Customer service
  void takeOrder() {
    print('Taking customer order...');
    // Order taking logic
  }
  
  void serveCustomer() {
    print('Serving customer...');
    // Customer serving logic
  }
  
  // Responsibility 4: Cleaning
  void cleanKitchen() {
    print('Cleaning kitchen...');
    // Kitchen cleaning logic
  }
  
  void cleanDiningArea() {
    print('Cleaning dining area...');
    // Dining area cleaning logic
  }
  
  // Responsibility 5: Financial management
  void calculateRevenue() {
    print('Calculating daily revenue...');
    // Revenue calculation logic
  }
  
  void payEmployees() {
    print('Processing employee payments...');
    // Payroll logic
  }
}

void main() {
  // Single class handling everything
  var bakery = Bakery('Happy Bakery');
  
  bakery.bakeBread();
  bakery.checkInventory();
  bakery.takeOrder();
  bakery.serveCustomer();
  bakery.cleanKitchen();
  bakery.calculateRevenue();
  // This class is now huge, hard to maintain, and difficult to test
}