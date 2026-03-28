// Base class for payment processing
abstract class PaymentProcessor {
  void processPayment(double amount);
}

// Credit card payment processor
class CreditCardPaymentProcessor implements PaymentProcessor {
  @override
  void processPayment(double amount) {
    print("Processing credit card payment of \$$amount");
  }
}

// PayPal payment processor
class PayPalPaymentProcessor implements PaymentProcessor {
  @override
  void processPayment(double amount) {
    print("Processing PayPal payment of \$$amount");
  }
}

// Function to process payment
void processPayment(PaymentProcessor processor, double amount) {
  processor.processPayment(amount);
}

void main() {
  CreditCardPaymentProcessor creditCardProcessor = CreditCardPaymentProcessor();
  PayPalPaymentProcessor payPalProcessor = PayPalPaymentProcessor();

  processPayment(creditCardProcessor, 100.00); // Processing credit card payment
  processPayment(payPalProcessor, 150.00);     // Processing PayPal payment
}