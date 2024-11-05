import 'package:flutter/material.dart';
import 'product_package/product.dart'; // Nhập lớp Product từ package
import 'screens/login_page.dart'; 
import 'package:flutter/material.dart';
import 'product_package/product.dart';


void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShopPage(), // Trang chính của cửa hàng
    );
  }
}

class ShopPage extends StatelessWidget {
  final List<Product> products = [
    Product('product1', 'assets/image/1.jpg'),
    Product('product2', 'assets/image/2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(products[index].imagePath), // Hiển thị ảnh
            title: Text(products[index].name),
            trailing: ElevatedButton(
              child: Text('Mua hàng'),
              onPressed: () {
                // Điều hướng đến trang đăng nhập
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Center(
        child: Text('Form đăng nhập sẽ hiển thị ở đây'),
      ),
    );
  }
}
