


import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavExample extends StatefulWidget {
  const AnimatedBottomNavExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBottomNavExampleState createState() => _AnimatedBottomNavExampleState();
}

class _AnimatedBottomNavExampleState extends State<AnimatedBottomNavExample> {
  // Controller للـ PageView (للتنقل بين الصفحات)
  final _pageController = PageController(initialPage: 0);
  
  // Controller للـ Bottom Navigation Bar  
  final _controller = NotchBottomBarController(index: 0);
  
  TextEditingController name = TextEditingController();
  
  // قائمة الصفحات
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(), 
    AddPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // عرض الصفحات
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // منع السحب اليدوي
        children: _pages,
      ),
      
      extendBody: true, // يخلي الـ body يمتد تحت الـ bottom bar
      
      // الـ Animated Bottom Navigation Bar
      bottomNavigationBar: AnimatedNotchBottomBar(
        // ربط الـ controller
        notchBottomBarController: _controller,
        
        // ألوان وتصميم
        color: Colors.white,
        notchColor: Colors.blue,
        
        // إعدادات النص
        showLabel: true,
        textOverflow: TextOverflow.ellipsis,
        maxLine: 1,
        
        // إعدادات الشكل
        shadowElevation: 5,
        kBottomRadius: 22.0,
        bottomBarWidth: MediaQuery.of(context).size.width,
        
        // مدة الحركة (بالميلي ثانية)
        durationInMilliSeconds: 300,
        
        // حجم الأيقونات ونمط النص
        kIconSize: 22.0,
        itemLabelStyle: TextStyle(fontSize: 12),
        
        // عناصر الـ Navigation Bar
        bottomBarItems: [
          
          // Home
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'الرئيسية',
          ),
          
          // Category  
          BottomBarItem(
            inActiveItem: Icon(
              Icons.category_outlined,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.category,
              color: Colors.white,
            ),
            itemLabel: 'الفئات',
          ),
          
          // Add
          BottomBarItem(
            inActiveItem: Icon(
              Icons.add_circle_outline,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            itemLabel: 'إضافة',
          ),
          
          // Settings
          BottomBarItem(
            inActiveItem: Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            itemLabel: 'إعدادات',
          ),
          
          // Profile
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.white,
            ),
            itemLabel: 'الملف الشخصي',
          ),
        ],
        
        // دالة التعامل مع الضغط
        onTap: (index) {
          print('تم الضغط على العنصر رقم: $index');
          
          // الانتقال للصفحة المطلوبة مع حركة ناعمة
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}

// صفحة الـ Home
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('الرئيسية'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.home,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'صفحة الرئيسية',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'مرحباً بك في التطبيق!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الفئات
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('الفئات'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.category,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'صفحة الفئات',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'تصفح الفئات المختلفة',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الإضافة
class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('إضافة جديد'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_circle,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'صفحة الإضافة',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'أضف محتوى جديد',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('تمت الإضافة بنجاح! 🎉'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text('إضافة عنصر'),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الإعدادات
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('الإعدادات'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.settings,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'صفحة الإعدادات',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'تخصيص التطبيق',
              style: TextStyle(
                fontSize: 16,
                color: Colors.purple[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الملف الشخصي
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('الملف الشخصي'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'الملف الشخصي',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'سيف محمد',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
