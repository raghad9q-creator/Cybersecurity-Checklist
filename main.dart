abstract class Payment {
  void pay();
}

class Product {
  static int productCount = 0;

  String name;
  double price;

  Product(this.name, this.price) {
    productCount++;
  }

  Product.free(this.name) : price = 0 {
    productCount++;
  }

  void showProduct() {
    print("المنتج: $name");
    print("السعر: $price ريال");
  }

  static double calculateDiscount(
      double price, double discount) {
    return price - (price * discount / 100);
  }
}

class ElectronicProduct extends Product {
  ElectronicProduct(String name, double price)
      : super(name, price);

  void warranty() {
    print("ضمان سنة");
  }
}

class MadaPayment implements Payment {
  @override
  void pay() {
    print("تم الدفع عن طريق مدى");
  }
}

void main() {

  // Object
  ElectronicProduct phone =
      ElectronicProduct("iPhone", 4000);

  phone.showProduct();
  phone.warranty();

  // Static Function
  double finalPrice =
      Product.calculateDiscount(4000, 10);

  print("السعر بعد الخصم: $finalPrice ريال");

  // Payment
  MadaPayment payment = MadaPayment();
  payment.pay();

  // Static Variable
  print("عدد المنتجات: ${Product.productCount}"