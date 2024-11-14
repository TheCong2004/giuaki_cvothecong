import 'package:flutter/material.dart';

// Widget chính cho trang đăng ký
class SingnUp extends StatefulWidget {
  const SingnUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SingnUp> {
  // Biến để xác định người dùng là 'Traveler' hay 'Guide'
  bool isTraveler = true;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(), // Xây dựng tiêu đề trang
              const SizedBox(height: 32),
              _buildRoleSelection(), // Xây dựng lựa chọn vai trò (Traveler/Guide)
              const SizedBox(height: 24),
              Row( // Sử dụng Row để xếp hai trường nhập trên cùng một hàng
                children: [
                  Expanded(
                    child: _buildTextField('First Name', 'Cong'), // Trường nhập cho Tên
                  ),
                  const SizedBox(width: 16), // Khoảng cách giữa hai trường nhập
                  Expanded(
                    child: _buildTextField('Last Name', 'Vo'), // Trường nhập cho Họ
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Email', 'Type email'), // Trường nhập cho Email
              const SizedBox(height: 16),
              _buildTextField('Password', 'Type password', isPassword: true), // Trường nhập cho Mật khẩu
              const SizedBox(height: 8),
              const Text(
                'Password must be at least 6 characters',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 16),
              _buildTextField('Confirm Password', '', isPassword: true), // Trường nhập cho Xác nhận mật khẩu
              const SizedBox(height: 24),
              _buildTermsAndConditions(), // Hiển thị điều khoản và điều kiện
              const SizedBox(height: 24),
              _buildSignUpButton(), // Nút đăng ký
              const SizedBox(height: 16),
              _buildSignInLink(context), // Liên kết đến trang đăng nhập
            ],
          ),
        ),
      ),
    ),
  );
}

 // Phương thức để xây dựng tiêu đề trang
Widget _buildHeader() {
  return Stack(
    children: [
      // Màu nền cho phần tiêu đề
      ClipPath(
        clipper: HeaderClipper(), // Sử dụng lớp CustomClipper để vẽ đường bo tròn
        child: Container(
          height: 152, // Chiều cao của phần nền
          color: Colors.teal, // Màu nền là màu xanh lá cây
        ),
      ),
      // Nội dung bên trong
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Căn lề ngang 24 đơn vị
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các thành phần con
          children: [
            Image.asset(
              'assets/5.png', // Thay đổi đường dẫn hình ảnh của bạn
              fit: BoxFit.cover,
              height: 30, // Chiếm toàn bộ chiều cao
              width: double.infinity, // Chiếm toàn bộ chiều rộng
            ),
            const SizedBox(height: 30), // Khoảng cách từ trên cùng xuống phần nội dung
            _buildLogo(), // Gọi hàm xây dựng logo
            const SizedBox(height: 60), // Khoảng cách giữa logo và tiêu đề
            const Text(
              'Sign In', // Tiêu đề của trang
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Kiểu chữ đậm, kích thước 24, màu trắng
            ),
          ],
        ),
      ),
    ],
  );
}

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
        'assets/4.png', // Đường dẫn tới tệp hình ảnh logo
        fit: BoxFit.cover, // Làm cho hình ảnh chiếm toàn bộ không gian của Container
      ),
    ),
  );
}




  // Phương thức để xây dựng lựa chọn vai trò
  Widget _buildRoleSelection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Lựa chọn 'Traveler'
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isTraveler = true), // Thay đổi trạng thái khi nhấn
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isTraveler ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Traveler',
                    style: TextStyle(
                      color: isTraveler ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Lựa chọn 'Guide'
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isTraveler = false), // Thay đổi trạng thái khi nhấn
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isTraveler ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Guide',
                    style: TextStyle(
                      color: !isTraveler ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Phương thức để xây dựng trường nhập liệu
  Widget _buildTextField(String label, String hintText, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nhãn trường nhập
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Trường nhập liệu
        TextField(
          obscureText: isPassword, // Ẩn văn bản nếu là mật khẩu
          decoration: InputDecoration(
            hintText: hintText, // Văn bản gợi ý
            hintStyle: TextStyle(color: Colors.grey[400]),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
        ),
      ],
    );
  }

  // Phương thức để xây dựng điều khoản và điều kiện
  Widget _buildTermsAndConditions() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(color: Colors.grey),
        children: [
          TextSpan(text: 'By signing up, you agree to our '),
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Phương thức để xây dựng nút đăng ký
  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Xử lý đăng ký ở đây
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('SIGN UP'),
      ),
    );
  }

  // Phương thức để xây dựng liên kết đến trang đăng nhập
  Widget _buildSignInLink(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Điều hướng đến trang đăng nhập
          Navigator.pop(context); // Giả sử bạn trở về trang đăng nhập
        },
        child: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Sign In',
                style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Lớp CustomClipper cho phần tiêu đề
class HeaderClipper extends CustomClipper<Path> {
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

