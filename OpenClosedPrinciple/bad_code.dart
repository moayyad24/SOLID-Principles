// Bad: This class needs to be modified every time we add a new payment method
class PaymentProcessor {
  String paymentType;
  
  PaymentProcessor(this.paymentType);
  
  void processPayment(double amount) {
    if (paymentType == "credit_card") {
      print("Processing credit card payment of \$$amount");
    } else if (paymentType == "paypal") {
      print("Processing PayPal payment of \$$amount");
    }
    // Every new payment method requires adding another else-if here
    // This violates Open/Closed Principle because the class is not closed for modification
  }
}

// Bad: The processPayment function is tightly coupled to the conditional logic
void processPayment(PaymentProcessor processor, double amount) {
  processor.processPayment(amount);
}

void main() {
  // Creating processors with different types
  PaymentProcessor creditCardProcessor = PaymentProcessor("credit_card");
  PaymentProcessor payPalProcessor = PaymentProcessor("paypal");
  
  processPayment(creditCardProcessor, 100.00);
  processPayment(payPalProcessor, 150.00);
  
  // If we want to add a new payment method like "crypto", we have to:
  // 1. Modify the PaymentProcessor class
  // 2. Add another else-if condition
  // 3. Potentially break existing code
  // This is why it violates Open/Closed Principle
}