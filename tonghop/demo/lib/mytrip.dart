import 'package:flutter/material.dart';
import 'Setting.dart';
import 'home.dart';


class Mytrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 222,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/home1.png', width: double.infinity, fit: BoxFit.cover ),
                title: Text('My Trips', style: TextStyle(color: Colors.white)),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.green),
                  onPressed: () {},
                ),
              ],
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.green,
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(text: 'Current Trips'),
                      Tab(text: 'Next Trips'),
                      Tab(text: 'Past Trips'),
                      Tab(text: 'Wish List'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildCurrentTripsList(), // Current Trips
                        buildNextTripsList(), // Next Trips
                        buildPastTripsList(), // Past Trips
                        buildWishList(), // Wish List
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),       
        bottomNavigationBar: BottomNavigationBar(
          onTap:  (index){
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
              }
            },
          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.explore, size: 28, color: Colors.black), // thành 'explore'
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map, size: 28, color: Colors.black), // Kích thước icon vừa phải
              label: 'My trip', // Nội dung label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 28, color: Colors.black),
              label: 'Messages' ,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 28, color: Colors.black),
              label: 'thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28, color: Colors.black),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  // Hàm dành cho Current Trips
  Widget buildCurrentTripsList() {
   return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
       Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home2.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dragon Bridge Trip', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Da Nang, Vietnam'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                       Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  // Thêm hình avatar bên phải
              
                ],
              ),
            ),
          ),

          ],
        ),
      ),
      ],
    );
  }

  // Hàm dành cho Next Trips
  Widget buildNextTripsList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
       Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/hom3.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                 
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                      Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      ),
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home4.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                 
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                      Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      ),

           Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home5.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                      Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        
                        SizedBox(width: 8),
                        Text('Start')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
        
      ),
      ],
    );
  }

  // Hàm dành cho Past Trips
  Widget buildPastTripsList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home6.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                      Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      ),
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home7.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                      Spacer(), // Tạo khoảng trống giữa Text và CircleAvatar
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/av.png'), // Đường dẫn đến ảnh avatar
                        radius: 20, // Kích thước của avatar
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      ),

      ],
    );
  }

  // Hàm dành cho Wish List
  Widget buildWishList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/home8.png', width: double.infinity, fit: BoxFit.cover), // Hình ảnh ở đầu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ho Chi Minh Mausoleum', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Ha Long, Vietnam'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 16),
                      SizedBox(width: 4),
                      Text('Feb 15, 2020'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('10:00 - 14:00'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16),
                      SizedBox(width: 4),
                      Text('Thế Công'),
                    ],
                  ),
                ],
              ),
            ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                     child: Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1416), // Xoay icon 180 độ
                          child: Icon(Icons.priority_high, size: 18, color: Colors.black),
                        ),
                        SizedBox(width: 8), // Tạo khoảng cách giữa chữ và icon
                        Text('Detail'),
                        
                        
                      ],
                    ),
                    
                  ),
                  SizedBox(width: 16), // Tạo khoảng cách giữa 2 nút
                  ElevatedButton(
                    onPressed: () {
                      // Chuyển hướng tới chi tiết chuyến đi
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('chat')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
        ),
      ),
      
      ],
    );
  }
}
