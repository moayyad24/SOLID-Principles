// GOOD: Each class has a single responsibility

// 1. Baking Responsibility
class Baker {
  final String name;

  Baker(this.name);

  void bakeBread() {
    print('$name is baking bread...');
    // Bread baking logic
  }

  void bakePastry() {
    print('$name is baking pastry...');
    // Pastry baking logic
  }
}

// 2. Inventory Management Responsibility
class InventoryManager {
  final Map<String, int> _stock = {};

  void addStock(String item, int quantity) {
    _stock[item] = (_stock[item] ?? 0) + quantity;
    print('Added $quantity of $item to inventory');
  }

  void checkInventory() {
    print('Current inventory: $_stock');
  }

  void removeStock(String item, int quantity) {
    if ((_stock[item] ?? 0) >= quantity) {
      _stock[item] = _stock[item]! - quantity;
      print('Removed $quantity of $item from inventory');
    } else {
      print('Insufficient stock for $item');
    }
  }
}

// 3. Supply Chain Responsibility
class SupplyOrderManager {
  void orderFlour(int quantity) {
    print('Ordering $quantity kg of flour from supplier...');
    // Supply ordering logic
  }

  void orderSugar(int quantity) {
    print('Ordering $quantity kg of sugar from supplier...');
    // Supply ordering logic
  }

  void orderButter(int quantity) {
    print('Ordering $quantity kg of butter from supplier...');
    // Supply ordering logic
  }
}

// 4. Customer Service Responsibility
class CustomerService {
  void takeOrder(String customerName, List<String> items) {
    print('Taking order from $customerName for: $items');
    // Order taking logic
  }

  void serveCustomer(String customerName) {
    print('Serving $customerName...');
    // Serving logic
  }

  void handleComplaint(String customerName, String issue) {
    print('Handling complaint from $customerName about: $issue');
    // Complaint handling logic
  }
}

// 5. Cleaning Responsibility
class Cleaner {
  final String name;

  Cleaner(this.name);

  void cleanKitchen() {
    print('$name is cleaning the kitchen...');
    // Kitchen cleaning logic
  }

  void cleanDiningArea() {
    print('$name is cleaning the dining area...');
    // Dining area cleaning logic
  }

  void sanitizeEquipment() {
    print('$name is sanitizing equipment...');
    // Equipment sanitizing logic
  }
}

// 6. Financial Responsibility
class FinanceManager {
  double _revenue = 0;
  double _expenses = 0;

  void addRevenue(double amount) {
    _revenue += amount;
    print('Added revenue: \$$amount');
  }

  void addExpense(double amount) {
    _expenses += amount;
    print('Added expense: \$$amount');
  }

  double calculateProfit() {
    return _revenue - _expenses;
  }

  void generateReport() {
    print('Revenue: \$$_revenue');
    print('Expenses: \$$_expenses');
    print('Profit: \$${calculateProfit()}');
  }
}

// Main bakery class that coordinates all responsibilities
class Bakery {
  final String name;
  final Baker baker;
  final InventoryManager inventory;
  final SupplyOrderManager supplyOrder;
  final CustomerService customerService;
  final Cleaner cleaner;
  final FinanceManager finance;

  Bakery({
    required this.name,
    required this.baker,
    required this.inventory,
    required this.supplyOrder,
    required this.customerService,
    required this.cleaner,
    required this.finance,
  });

  void runDailyOperations() {
    print('\n=== Starting daily operations at $name ===\n');

    // Morning routine
    baker.bakeBread();
    inventory.checkInventory();

    // Customer service
    customerService.takeOrder('John', ['bread', 'pastry']);
    customerService.serveCustomer('John');

    // Inventory management
    inventory.removeStock('flour', 2);

    // Financial tracking
    finance.addRevenue(25.50);

    // End of day
    cleaner.cleanKitchen();
    finance.generateReport();

    // Reorder if needed
    if (inventory._stock['flour']! < 10) {
      supplyOrder.orderFlour(50);
    }
  }
}

void main() {
  // Create specialized objects
  var baker = Baker('Mike');
  var inventory = InventoryManager();
  var supplyOrder = SupplyOrderManager();
  var customerService = CustomerService();
  var cleaner = Cleaner('Anna');
  var finance = FinanceManager();

  // Initialize inventory
  inventory.addStock('flour', 100);
  inventory.addStock('sugar', 50);
  inventory.addStock('butter', 30);

  // Create bakery with all its specialized components
  var bakery = Bakery(
    name: 'Happy Bakery',
    baker: baker,
    inventory: inventory,
    supplyOrder: supplyOrder,
    customerService: customerService,
    cleaner: cleaner,
    finance: finance,
  );

  // Run bakery operations
  bakery.runDailyOperations();
}
