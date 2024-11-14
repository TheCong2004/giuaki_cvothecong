import 'package:flutter/material.dart'; // Nhập thư viện Flutter Material
import 'Setting.dart';
import 'mytrip.dart';
import 'blog.dart';
import 'journeys.dart';

class HomePage extends StatelessWidget { // Lớp HomePage kế thừa từ StatelessWidget
  @override
   Widget build(BuildContext context) { // Phương thức build để xây dựng giao diện
    return Scaffold( // Scaffold là widget cơ bản cho các ứng dụng Flutter
      body: SafeArea( // Đảm bảo nội dung không bị che khuất bởi các thành phần hệ thống
        child: Column( // Sử dụng Column để sắp xếp các widget theo chiều dọc
          children: [
            _buildAppBar(), // Gọi phương thức xây dựng AppBar
            _buildSearchBar(), // Gọi phương thức xây dựng thanh tìm kiếm
            Expanded( // Mở rộng phần còn lại của màn hình cho nội dung
              child: SingleChildScrollView( // Cho phép cuộn nếu nội dung quá dài
                child: Column( // Sắp xếp các widget trong nội dung cuộn
                  children: [
                    _buildGuideList(), // Danh sách hướng dẫn viên
                    _buildGuidesInDanang(), // Danh sách hướng dẫn viên tại Đà Nẵng
                    _buildTopExperiences(), // Danh sách trải nghiệm hàng đầu
                    FeaturedTours(), // Danh sách tour nổi bật
                  ],
                  
                ),
              ),
              
            ),
          ],
        ),
      ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == 1) { // Kiểm tra nếu người dùng nhấn vào nút My trip
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Mytrip()), // Điều hướng tới MyTrip
                );
              } else if (index == 4) { // Kiểm tra nếu người dùng nhấn vào nút Settings
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Setting()), // Điều hướng tới Setting
                );
              } else if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
               } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Blog()),
                );
                 } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Journeys()),
                );
              }
            },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 28, color: Colors.black), // biểu tượng 'explore'
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 28, color: Colors.black), // Kích thước icon vừa phải
            label: 'My trip', // Nội dung label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 28, color: Colors.black),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 28, color: Colors.black),
            label: 'Thông báo', // Chỉnh sửa tên hiển thị cho phù hợp
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28, color: Colors.black),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
  

  Widget _buildAppBar() { // Phương thức xây dựng AppBar
    return Container(
      padding: EdgeInsets.all(16), // Padding cho Container
      decoration: BoxDecoration( // Thiết lập hình nền cho AppBar
        image: DecorationImage(
          image: AssetImage('assets/5.png'), // Hình ảnh nền
          fit: BoxFit.cover, // Đảm bảo hình ảnh phủ kín
        ),
      ),
      child: Row( // Sắp xếp các widget bên trong theo hàng ngang
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa khoảng cách giữa các widget
        children: [
          Text(
            'Explore', // Tiêu đề của AppBar
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Định dạng văn bản
          ),
          Row( // Thanh thông tin thời tiết
            children: [
              Icon(Icons.wb_sunny, color: Colors.white), // Biểu tượng thời tiết
              Text('26°C', style: TextStyle(fontSize: 18, color: Colors.white)), // Nhiệt độ
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() { // Phương thức xây dựng thanh tìm kiếm
    return Container(
      margin: EdgeInsets.all(16), // Khoảng cách xung quanh
      padding: EdgeInsets.symmetric(horizontal: 16), // Padding ngang
      decoration: BoxDecoration(
        color: Colors.grey[200], // Màu nền cho thanh tìm kiếm
        borderRadius: BorderRadius.circular(25), // Bo tròn các góc
      ),
      child: TextField( // Widget nhập văn bản
        decoration: InputDecoration(
          hintText: 'Hi, where do you want to guide?', // Văn bản gợi ý
          border: InputBorder.none, // Không có đường viền
          icon: Icon(Icons.search), // Biểu tượng tìm kiếm
        ),
      ),
    );
  }

  Widget _buildGuideList() { // Phương thức xây dựng danh sách hướng dẫn viên
    return Column(
      children: [
        _buildSectionTitle('Finding a Guide'), // Tiêu đề phần
        _buildGuideItem('assets/1.png', 'Yoo Jin', 'Korea', 'Jan 30, 2020', 'Danang, Vietnam'), // Hướng dẫn viên 1
        _buildGuideItem('assets/2.png', 'Jon Mark', 'Spain', 'Jan 30, 2020', 'Danang, Vietnam'), // Hướng dẫn viên 2
        _buildGuideItem('assets/3.png', 'Lynd Nguyen', 'US', 'Jan 30, 2020', 'Danang, Vietnam'), // Hướng dẫn viên 3
        _buildGuideItem('assets/4.png', 'Patrick', 'Italy', 'Jan 30, 2020', 'Danang, Vietnam'), // Hướng dẫn viên 4
      ],
    );
  }

  Widget _buildSectionTitle(String title) { // Phương thức xây dựng tiêu đề phần
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Khoảng cách xung quanh
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa khoảng cách
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Tiêu đề
          Text('SEE MORE', style: TextStyle(color: Colors.blue)), // Liên kết xem thêm
        ],
      ),
    );
  }

  Widget _buildGuideItem(String imageUrl, String name, String country, String date, String location) { // Phương thức xây dựng một mục hướng dẫn
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Khoảng cách xung quanh
      decoration: BoxDecoration(
        color: Colors.grey[300], // Màu nền
        borderRadius: BorderRadius.circular(8), // Bo tròn các góc
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Màu bóng đổ
            spreadRadius: 2, // Kích thước bóng
            blurRadius: 5, // Độ mờ của bóng
            offset: Offset(0, 3), // Vị trí bóng
          ),
        ],
      ),
      child: Row( // Sắp xếp các widget theo hàng ngang
        children: [
          // Hình ảnh của hướng dẫn viên
          Container(
            width: 100, // Chiều rộng hình ảnh
            height: 100, // Chiều cao hình ảnh
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl), // Hình ảnh từ thư mục assets
                fit: BoxFit.cover, // Đảm bảo hình ảnh phủ kín
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), // Bo tròn góc trên bên trái
                bottomLeft: Radius.circular(8), // Bo tròn góc dưới bên trái
              ),
            ),
          ),
          // Thông tin hướng dẫn viên
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8), // Padding xung quanh
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
                children: [
                  Text('$name from $country', style: TextStyle(fontWeight: FontWeight.bold)), // Tên và quốc gia
                  SizedBox(height: 4), // Khoảng cách giữa các widget
                  Text('Finding a Guide'), // Tiêu đề phụ
                  SizedBox(height: 4), // Khoảng cách giữa các widget
                  Row( // Thông tin ngày
                    children: [
                      Icon(Icons.calendar_today, size: 16), // Biểu tượng ngày
                      SizedBox(width: 4), // Khoảng cách
                      Text(date), // Ngày
                    ],
                  ),
                  Row( // Thông tin địa điểm
                    children: [
                      Icon(Icons.location_on, size: 16), // Biểu tượng địa điểm
                      SizedBox(width: 4), // Khoảng cách
                      Text(location), // Địa điểm
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidesInDanang() { // Phương thức xây dựng danh sách hướng dẫn viên tại Đà Nẵng
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
      children: [
        Padding(
          padding: EdgeInsets.all(16), // Khoảng cách xung quanh
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa khoảng cách
            children: [
              Text(
                'Guides in Danang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Tiêu đề phần
              ),
              Text(
                'SEE MORE',
                style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold), // Liên kết xem thêm
              ),
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true, // Dùng kích thước của nội dung
          physics: NeverScrollableScrollPhysics(), // Không cho phép cuộn
          crossAxisCount: 2, // Số cột trong Grid
          childAspectRatio: 0.8, // Tỷ lệ chiều rộng chiều cao của các ô
          padding: EdgeInsets.all(16), // Padding xung quanh
          mainAxisSpacing: 16, // Khoảng cách giữa các hàng
          crossAxisSpacing: 16, // Khoảng cách giữa các cột
          children: [
            _buildGuideCard(
              name: 'Tuan Tran',
              location: 'Danang, Vietnam',
              imageUrl: 'assets/6.png',
              reviews: 127,
              rating: 5,
            ),
            _buildGuideCard(
              name: 'Emmy',
              location: 'Hanoi, Vietnam',
              imageUrl: 'assets/7.png',
              reviews: 89,
              rating: 5,
            ),
            _buildGuideCard(
              name: 'Linh',
              location: 'Danang, Vietnam',
              imageUrl: 'assets/8.png',
              reviews: 127,
              rating: 5,
              cardColor: Colors.pink[100], // Màu nền cho card
            ),
            _buildGuideCard(
              name: 'Minh',
              location: 'Danang, Vietnam',
              imageUrl: 'assets/9.png',
              reviews: 127,
              rating: 5,
              borderColor: Colors.purple, // Màu viền cho card
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGuideCard({ // Phương thức xây dựng card cho hướng dẫn viên
    required String name,
    required String location,
    required String imageUrl,
    required int reviews,
    required int rating,
    Color? cardColor, // Tùy chọn màu nền
    Color? borderColor, // Tùy chọn màu viền
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor ?? Colors.white, // Màu nền (mặc định là trắng)
        borderRadius: BorderRadius.circular(16), // Bo tròn các góc
        border: borderColor != null ? Border.all(color: borderColor, width: 2) : null, // Viền (nếu có)
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Màu bóng đổ
            blurRadius: 4, // Độ mờ của bóng
            offset: Offset(0, 2), // Vị trí bóng
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
        
          children: [
      Expanded(
        child: ClipRRect( // Bo tròn góc hình ảnh
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Bo tròn góc trên
          child: Image(
            image: AssetImage(imageUrl), // Hình ảnh từ thư mục assets
            fit: BoxFit.cover, // Đảm bảo hình ảnh phủ kín
            width: double.infinity, // Chiều rộng tối đa
          ),
        ),
      ),
      Padding(
      padding: EdgeInsets.all(8), // Padding xung quanh
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
        children: [
          Align(

            alignment: Alignment.bottomLeft, // Căn xuống góc dưới bên trái
            child: Row(
              children: List.generate(
                
                rating, // Tạo số sao dựa vào đánh giá
                (index) => Icon(Icons.star, color: Colors.amber, size: 16), // Biểu tượng sao
              ),
              
            ),
          ),
          // Đảm bảo rằng `reviews` là một giá trị hợp lệ
          Text('${reviews.toString()} Reviews', style: TextStyle(fontSize: 12)), // Số lượng đánh giá
          SizedBox(height: 4), // Khoảng cách giữa các widget
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)), // Tên hướng dẫn viên
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.teal, size: 16), // Biểu tượng địa điểm
              SizedBox(width: 4), // Khoảng cách
              Text(location, style: TextStyle(fontSize: 12, color: Colors.grey[600])), // Địa điểm
            ],
          ),
        ],
      ),
    )

    ],
  ),
);
}




  Widget _buildTopExperiences() {
  return SingleChildScrollView( // Thêm 'return' ở đây
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Top Experiences',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 250, // Điều chỉnh giá trị này nếu cần
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildExperienceCard(
                imageUrl: 'assets/10.png',
                guideImageUrl: 'assets/6.png',
                guideName: 'Tuan Tran',
                title: '2 Hour Bicycle Tour exploring Hoian',
                location: 'Hoian, Vietnam',
              ),
              SizedBox(width: 16),
              _buildExperienceCard(
                imageUrl: 'assets/11.png',
                guideImageUrl: 'assets/8.png',
                guideName: 'Linh Hana',
                title: '1 day at Bana Hill',
                location: 'Bana, Vietnam',
              ),
              
            ],
            
          ),
        ),
        
      ],
      
    ),
    
  );
  
}


 // Widget tạo từng thẻ trải nghiệm
Widget _buildExperienceCard({
  required String imageUrl, // Đường dẫn hình ảnh của trải nghiệm
  required String guideImageUrl, // Đường dẫn hình ảnh của hướng dẫn viên
  required String guideName, // Tên của hướng dẫn viên
  required String title, // Tiêu đề của trải nghiệm
  required String location, // Địa điểm của trải nghiệm
  Color? cardColor, // Tùy chọn màu nền
  Color? borderColor, // Tùy chọn màu viền
}) {
  return Container(
    width: 300, // Chiều rộng của từng thẻ
    decoration: BoxDecoration(
      color: cardColor ?? Colors.white, // Màu nền (mặc định là trắng)
      borderRadius: BorderRadius.circular(16), // Bo góc thẻ
      border: Border.all(color: borderColor ?? Colors.transparent, width: 2), // Màu viền (nếu có)
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần ảnh nền
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ), // Bo góc trên của ảnh
              child: Image.asset(
                imageUrl,
                height: 150, // Chiều cao của ảnh
                width: double.infinity,
                fit: BoxFit.cover, // Ảnh bao phủ toàn bộ khu vực
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Khoảng đệm bên trong nội dung
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // Hiển thị tiêu đề trải nghiệm
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4), // Khoảng cách giữa các phần
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.teal, size: 16), // Biểu tượng địa điểm
                      SizedBox(width: 4),
                      Text(
                        location, // Địa điểm
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // Hình ảnh và tên hướng dẫn viên đè lên góc phải của ảnh nền
        Positioned(
          top: 60, // Đẩy vị trí của avatar lên trên hình ảnh
          right: 110, // Căn lề phải
          child: Column(
            children: [
              
             Container(
                padding: EdgeInsets.all(2), // Độ dày của viền
                decoration: BoxDecoration(
                  color: Colors.green, // Màu viền xanh
                  shape: BoxShape.circle, // Đảm bảo viền tròn
                ),
                child: CircleAvatar(
                  radius: 20, // Kích thước của avatar
                  backgroundImage: AssetImage(guideImageUrl), // Ảnh của hướng dẫn viên
                ),
              ),
              SizedBox(height: 4),
              // Bọc tên hướng dẫn viên vào Container với màu nền xanh và căn giữa
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 207, 76), // Màu nền xanh
                  borderRadius: BorderRadius.circular(12), // Bo góc
                ),
                alignment: Alignment.center, // Căn giữa nội dung bên trong Container
                child: Text(
                  guideName, // Tên hướng dẫn viên
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 12, 
                    color: Colors.white, // Màu chữ trắng
                  ),
                  textAlign: TextAlign.center, // Căn giữa văn bản
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget FeaturedTours() { // Phương thức xây dựng danh sách hướng dẫn viên tại Đà Nẵng
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
    children: [
      Padding(
        padding: EdgeInsets.all(16), // Khoảng cách xung quanh
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa khoảng cách
          children: [
            Text(
              'Featured Tours',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Tiêu đề phần
            ),
            Text(
              'SEE MORE',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold), // Liên kết xem thêm
            ),
          ],
        ),
      ),
      Column( // Thay thế GridView bằng Column
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Khoảng cách giữa các card
            child: SizedBox( // Thay Expanded bằng SizedBox
              height: 400, // Chiều cao cụ thể
              child: _FeaturedToursCard(
                image: 'assets/12.png',
                title: 'Da Nang - Ba Na - Hoi An ',
                date: 'Jan 30, 2020',
                duration: '3 days',
                
                likes: 127,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox( // Thay Expanded bằng SizedBox
              height: 400, // Chiều cao cụ thể
              child: _FeaturedToursCard(
                image: 'assets/13.png',
                title: 'Melbourne - Sydney',
                date: 'Jan 30, 2020',
                duration: '3 days',
            
                likes: 89,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox( // Thay Expanded bằng SizedBox
              height: 400, // Chiều cao cụ thể
              child: _FeaturedToursCard(
                image: 'assets/14.png',
                title: 'Hanoi - Ha Long Bay',
                date: 'Jan 30, 2020',
                duration: '3 days',
              
                likes: 127,
               
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _FeaturedToursCard({
  required String image,
  required String title,
  required String date,
  required String duration,
  
  required int likes,
  Color? cardColor, // Tùy chọn màu nền
  Color? borderColor, // Tùy chọn màu viền
}) {
  return Container(
    decoration: BoxDecoration(
      color: cardColor ?? Colors.white, // Màu nền (mặc định là trắng)
      borderRadius: BorderRadius.circular(16), // Bo tròn các góc
      border: borderColor != null ? Border.all(color: borderColor, width: 2) : null, // Viền (nếu có)
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Màu bóng đổ
          blurRadius: 4, // Độ mờ của bóng
          offset: Offset(0, 2), // Vị trí bóng
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
      children: [
        Stack( // Sử dụng Stack để xếp chồng
          children: [
            ClipRRect( // Bo tròn góc hình ảnh
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Bo tròn góc trên
              child: Image(
                image: AssetImage(image), // Hình ảnh từ thư mục assets
                fit: BoxFit.cover, // Đảm bảo hình ảnh phủ kín
                width: double.infinity, // Chiều rộng tối đa
                height: 250, // Chiều cao của hình ảnh
              ),
            ),
            // Vị trí cho biểu tượng đánh giá có thể thêm nếu cần
            Positioned(
               // Nếu bạn muốn thêm biểu tượng đánh giá
              top: 200, // Khoảng cách từ phía trên
              left: 20, // Khoảng cách từ bên trái
              
              child: Row(
                children: List.generate(
                  5, // Giả định có 5 sao tối đa
                  (index) => Icon(Icons.star, color: Colors.amber, size: 20), // Biểu tượng sao
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8), // Padding xung quanh
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
            children: [
               Row(
              children: [
                Text(
                  title, 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ), // Tiêu đề
                Spacer(), // Đẩy biểu tượng trái tim về bên phải
                Icon(Icons.favorite, color: Colors.red, size: 16), // Biểu tượng trái tim
              ],
            ),
              SizedBox(height: 4), // Khoảng cách giữa các widget
              Text('Date: $date', style: TextStyle(fontSize: 12)), // Ngày
              Text('Duration: $duration', style: TextStyle(fontSize: 12)), // Thời gian
              SizedBox(height: 4), // Khoảng cách giữa các widget
              // Align(
              //   alignment: Alignment.centerRight, // Căn lề phải
              //   child: Text('Price: \$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 12, color: Colors.green )), // Giá
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Căn lề phải cho hàng
                children: [
                  Icon(Icons.thumb_up, color: Colors.green, size: 16,), // Biểu tượng lượt thích
                  SizedBox(width: 4), // Khoảng cách
                  Text('$likes Likes', style: TextStyle(fontSize: 12, color: Colors.green)), // Số lượt thích
                ],
              ),
              
            ],
            
          ),
        ),
      ],
      
    ),
    
  );
  
}







}