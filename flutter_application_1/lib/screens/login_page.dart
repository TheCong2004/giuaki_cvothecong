import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Hàm xử lý khi người dùng nhấn nút đăng nhập
  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Bạn có thể thêm logic xác thực tại đây (kiểm tra tài khoản, gọi API, v.v.)
      if (email == 'test@example.com' && password == 'password') {
        // Điều hướng đến trang chủ hoặc trang khác nếu đăng nhập thành công
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyShopApp()), // Giả sử điều hướng về ShopPage
        );
      } else {
        // Hiển thị thông báo lỗi nếu đăng nhập không thành công
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Đăng nhập thất bại'),
            content: Text('Tài khoản hoặc mật khẩu không chính xác!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Trường nhập email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Trường nhập mật khẩu
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true, // Ẩn mật khẩu
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),

              // Nút đăng nhập
              ElevatedButton(
                onPressed: _login,
                child: Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
