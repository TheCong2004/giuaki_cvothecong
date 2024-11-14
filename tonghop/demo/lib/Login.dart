import 'package:flutter/material.dart';
import 'singnup.dart';
import 'package:flutter/gestures.dart';


// Widget chính của trang đăng nhập
class Longin extends StatelessWidget {
  const Longin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea giúp tránh các phần bị che bởi thanh trạng thái hoặc tai thỏ
      body: SafeArea(
        // Stack dùng để xếp chồng các widget. Ở đây ta có phần nền phía trên và nội dung phía dưới
        child: Stack(
          children: [
            // Nền hình vòng cung bo tròn sử dụng ClipPath để cắt hình
            ClipPath(
              clipper: CustomCurveClipper(), // Sử dụng lớp CustomClipper để vẽ đường bo tròn
              child: Container(
                height: 152, // Chiều cao của phần nền
                color: Colors.teal, // Màu nền là màu xanh lá cây
              ),
            ),
            // Phần nội dung chính của trang đăng nhập được bọc bởi Padding để tạo khoảng cách với viền màn hình
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0), // Căn lề ngang 24 đơn vị
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các thành phần con
                children: [
                  Image.asset(
                        'assets/login5.png', // Thay đổi đường dẫn hình ảnh của bạn
                        fit: BoxFit.cover,
                        height: 30, // Chiếm toàn bộ chiều cao
                        width: double.infinity, // Chiếm toàn bộ chiều rộng
                      ),
                  SizedBox(height: 30), // Khoảng cách từ trên cùng xuống phần nội dung
                  _buildLogo(), // Gọi hàm xây dựng logo
                  SizedBox(height: 60), // Khoảng cách giữa logo và tiêu đề
                  Text(
                    'Sign In', // Tiêu đề của trang
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Kiểu chữ đậm, kích thước 24
                  ),
                  SizedBox(height: 8), // Khoảng cách giữa tiêu đề và lời chào
                  Text(
                    'Welcome back, The cong', // Lời chào người dùng
                    style: TextStyle(fontSize: 16, color: Colors.grey), // Kiểu chữ màu xám
                  ),
                  SizedBox(height: 32), // Khoảng cách giữa lời chào và ô nhập liệu
                  _buildTextField('Email', 'thecong@gmail.com'), // Ô nhập email
                  SizedBox(height: 16), // Khoảng cách giữa các ô nhập liệu
                  _buildTextField('Password', '••••••', isPassword: true), // Ô nhập mật khẩu với kí tự ẩn
                  SizedBox(height: 8), // Khoảng cách dưới ô nhập mật khẩu
                  Align(
                    alignment: Alignment.centerRight, // Căn phải cho nút 'Forgot Password'
                    child: Text(
                      'Forgot Password?', // Văn bản quên mật khẩu
                      style: TextStyle(color: Colors.teal), // Màu văn bản là màu teal
                    ),
                  ),
                  SizedBox(height: 32), // Khoảng cách trước nút đăng nhập
                  _buildSignInButton(), // Nút đăng nhập
                  Spacer(), // Đẩy các phần còn lại xuống dưới cùng
                  _buildSocialSignIn(), // Các nút đăng nhập mạng xã hội
                  SizedBox(height: 16), // Khoảng cách dưới các nút mạng xã hội
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black), // Kiểu chữ chung là màu đen
                        children: [
                          TextSpan(text: "Don't have an account? "), // Văn bản thông thường
                          TextSpan(
                            text: "Sign up", // Văn bản nhấn mạnh có thể bấm
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                ), // Văn bản in đậm và màu teal
                                recognizer: TapGestureRecognizer() // Thêm sự kiện nhấn
                                  ..onTap = () {
                                    // Điều hướng đến trang SignUp
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SingnUp()),
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24), // Khoảng cách cuối trang
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo logo
Widget _buildLogo() {
  return Container(
    width: 40, // Chiều rộng của logo
    height: 40, // Chiều cao của logo
    decoration: BoxDecoration(
      color: Colors.teal, // Màu nền nếu cần
      borderRadius: BorderRadius.circular(8), // Bo tròn các góc logo
    ),
    child: ClipOval( // Bo tròn logo thành hình tròn
      child: Image.asset(
        'assets/login4.png', // Đường dẫn tới tệp hình ảnh logo
        fit: BoxFit.cover, // Làm cho hình ảnh chiếm toàn bộ không gian của Container
      ),
    ),
  );
}


  // Hàm tạo ô nhập liệu
  Widget _buildTextField(String label, String hintText, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)), // Nhãn của ô nhập liệu
        SizedBox(height: 8), // Khoảng cách giữa nhãn và ô nhập
        TextField(
          obscureText: isPassword, // Nếu là ô mật khẩu, các kí tự sẽ được ẩn
          decoration: InputDecoration(
            hintText: hintText, // Gợi ý nội dung trong ô nhập
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Bo tròn các góc của ô nhập
            ),
          ),
        ),
      ],
    );
  }

  // Hàm tạo nút đăng nhập
  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity, // Nút sẽ chiếm toàn bộ chiều ngang màn hình
      child: ElevatedButton(
        onPressed: () {}, // Hàm xử lý khi nhấn nút (hiện tại chưa thực hiện gì)
        child: const Text('Sign In'), // Nội dung hiển thị trên nút
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal, // Màu nền của nút là màu teal
          foregroundColor: Colors.white, // Màu chữ là màu trắng
          padding: const EdgeInsets.symmetric(vertical: 16), // Độ dày của nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bo tròn các góc nút
          ),
        ),
      ),
    );
  }

  // Hàm tạo các nút đăng nhập bằng mạng xã hội (Google, Facebook, Apple)
  Widget _buildSocialSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
      children: [
        _socialButton('assets/login2.png'), // Nút Google
        SizedBox(width: 16), // Khoảng cách giữa các nút
        _socialButton('assets/login1.png'), // Nút Facebook
        SizedBox(width: 16), // Khoảng cách giữa các nút
        _socialButton('assets/login3.png'), // Nút Apple
      ],
    );
  }

  // Hàm tạo nút cho mạng xã hội
  Widget _socialButton(String assetName) {
    return Container(
      width: 40, // Chiều rộng nút
      height: 40, // Chiều cao nút
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), // Viền nút màu xám
        borderRadius: BorderRadius.circular(8), // Bo tròn các góc nút
      ),
      child: Center(
        child: Image.asset(assetName, width: 24, height: 24), // Hình ảnh logo của mạng xã hội
      ),
    );
  }
}

// Lớp CustomClipper để vẽ đường bo tròn cho phần nền trên cùng
class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height  - 20); // Vẽ đường từ điểm bắt đầu đến điểm dưới cùng của hình
    var controlPoint = Offset(size.width / 2, size.height - 70); // Điểm điều khiển cho đường cong
    var endPoint = Offset(size.width, size.height - 20); // Điểm kết thúc của đường cong
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy); // Vẽ đường cong Bezier
    path.lineTo(size.width, 0); // Đóng đường viền của hình
    path.close(); // Kết thúc vẽ hình
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false; // Không cần vẽ lại clip
}
