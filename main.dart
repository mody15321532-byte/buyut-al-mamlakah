import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EaglesEyeApp());
}

class EaglesEyeApp extends StatelessWidget {
  const EaglesEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eagle's Eye Security",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121826),
      ),
      home: const SplashScreen(),
    );
  }
}

// ==========================================
// 1. الشاشة الترحيبية (Splash Screen)
// ==========================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Eagle's Eye Security",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'متجر ونظام الأمان الذكي',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. شاشة تسجيل الدخول (Login Screen)
// ==========================================
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Eagle's Eye",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 35),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.blue),
                  hintText: 'اسم المستخدم / البريد الإلكتروني',
                  filled: true,
                  fillColor: const Color(0xFF1F293D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  hintText: 'كلمة المرور',
                  filled: true,
                  fillColor: const Color(0xFF1F293D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 3. الصفحة الرئيسية والتنقل (Main Navigation)
// ==========================================
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const StorePage(),
    const DashboardPage(),
    const LiveCamerasPage(),
    const InstallationRequestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1F293D),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'المتجر',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'التحكم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'الكاميرات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'التركيب',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. واجهة المتجر الإلكتروني (Store Page)
// ==========================================
class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: const Text("متجر Eagle's Eye"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Color(0xFF1F293D)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خصم 15% على كاميرات Hikvision',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'احصل على أفضل أجهزة الأمان مع خدمة التركيب مجاناً',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'الأجهزة المتاحة للشراء',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
              children: [
                _buildProductCard(
                  context,
                  name: 'Hikvision 4MP Camera',
                  category: 'كاميرات مراقبة',
                  price: '1,250 ج.م',
                  icon: Icons.videocam,
                  iconColor: Colors.blue,
                  description: 'كاميرا مراقبة عالية الدقة 4 ميجابكسل، رؤية لليلة واضحة ومقاومة للعوامل الجوية.',
                ),
                _buildProductCard(
                  context,
                  name: 'Smart Lock Pro X',
                  category: 'أقفال أبواب ذكية',
                  price: '3,800 ج.م',
                  icon: Icons.lock,
                  iconColor: Colors.green,
                  description: 'قفل باب ذكي يدعم البصمة، الكارت الذكي، الرقم السري وتطبيق الهاتف.',
                ),
                _buildProductCard(
                  context,
                  name: 'Hikvision DVR 8-CH',
                  category: 'أجهزة تسجيل',
                  price: '2,900 ج.م',
                  icon: Icons.dns,
                  iconColor: Colors.amber,
                  description: 'جهاز تسجيل رقمي يدعم حتى 8 كاميرات بجودة عالية مع إمكانية المراقبة عن بعد.',
                ),
                _buildProductCard(
                  context,
                  name: 'Motion Sensor Alarm',
                  category: 'حساس حركة وإنذار',
                  price: '650 ج.م',
                  icon: Icons.notifications_active,
                  iconColor: Colors.redAccent,
                  description: 'حساس حركة ذكي يرسل تنبيهات فوريّة لهاتفك عند رصد أي حركة غريبة.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required String name,
    required String category,
    required String price,
    required IconData icon,
    required Color iconColor,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              name: name,
              category: category,
              price: price,
              icon: icon,
              iconColor: iconColor,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1F293D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF121826),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 50, color: iconColor),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              category,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(height: 2),
            Text(
              name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, size: 16, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4.1 صفحة تفاصيل المنتج (Product Details Page)
// ==========================================
class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String category;
  final String price;
  final IconData icon;
  final Color iconColor;
  final String description;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.iconColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F293D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, size: 80, color: iconColor),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              category,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'وصف المنتج:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تمت إضافة المنتج إلى سلة المشتريات بنجاح')),
                  );
                },
                child: const Text(
                  'إضافة إلى السلة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. لوحة التحكم بالأجهزة (Dashboard Page)
// ==========================================
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isSystemArmed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: const Text("لوحة تحكم الأجهزة"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isSystemArmed
                    ? Colors.blue.withOpacity(0.15)
                    : Colors.red.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSystemArmed ? Colors.blue : Colors.red,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    isSystemArmed ? Icons.shield : Icons.gpp_maybe,
                    size: 45,
                    color: isSystemArmed ? Colors.blue : Colors.red,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isSystemArmed
                              ? 'النظام مفعّل ومُؤمّن'
                              : 'النظام متوقف عن التفعيل',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isSystemArmed
                              ? 'جميع الحساسات تعمل بنجاح'
                              : 'انتبه، بعض الحساسات معطلة',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: isSystemArmed,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        isSystemArmed = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'سجل التنبيهات والأحداث',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildAlertCard(
              title: 'تم رصد حركة مشبوهة',
              time: 'منذ 10 دقائق - الكاميرا الأمامية',
              icon: Icons.warning_amber_rounded,
              color: Colors.orange,
            ),
            _buildAlertCard(
              title: 'تفعيل نظام الحماية الذكي',
              time: 'منذ ساعة - بواسطة المستخدم',
              icon: Icons.security,
              color: Colors.blue,
            ),
            _buildAlertCard(
              title: 'تم فتح الباب الذكي بنجاح',
              time: 'منذ 3 ساعات - القفل الرئيسي',
              icon: Icons.lock_open,
              color: Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.phone, color: Colors.white),
        label: const Text('طوارئ / اتصال', style: TextStyle(color: Colors.white)),
        onPressed: () async {
          final Uri launchUri = Uri(scheme: 'tel', path: '122');
          if (await canLaunchUrl(launchUri)) {
            await launchUrl(launchUri);
          }
        },
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F293D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  time,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 6. شاشة البث المباشر للكاميرات (Live Cameras Page)
// ==========================================
class LiveCamerasPage extends StatelessWidget {
  const LiveCamerasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: const Text('البث المباشر للكاميرات'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _buildCameraView('كاميرا البوابة الرئيسية', Colors.blue),
          _buildCameraView('كاميرا الجراج الداخلي', Colors.green),
          _buildCameraView('كاميرا الممر الخلفي', Colors.orange),
          _buildCameraView('كاميرا غرفة الاستقبال', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildCameraView(String cameraName, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F293D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF121826),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Icon(Icons.videocam, size: 50, color: color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cameraName,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 7. شاشة طلب التركيب والصيانة (Installation Request Page)
// ==========================================
class InstallationRequestPage extends StatefulWidget {
  const InstallationRequestPage({super.key});

  @override
  State<InstallationRequestPage> createState() => _InstallationRequestPageState();
}

class _InstallationRequestPageState extends State<InstallationRequestPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: const Text('طلب تركيب وصيانة'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أدخل بياناتك لطلب فريق فني للتركيب الفوري',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: Colors.blue),
                hintText: 'الاسم الكامل',
                filled: true,
                fillColor: const Color(0xFF1F293D),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                hintText: 'رقم الهاتف',
                filled: true,
                fillColor: const Color(0xFF1F293D),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on, color: Colors.blue),
                hintText: 'العنوان بالتفصيل',
                filled: true,
                fillColor: const Color(0xFF1F293D),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم إرسال طلب التركيب بنجاح، سنتواصل معك قريباً')),
                  );
                },
                child: const Text(
                  'إرسال الطلب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 8. شاشة الإعدادات (Settings Page)
// ==========================================
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pushNotifications = true;
  bool soundAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F293D),
        title: const Text('الإعدادات والبروفايل'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('إعدادات التنبيهات', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text('الإشعارات الفورية', style: TextStyle(color: Colors.white)),
            subtitle: const Text('تلقي تنبيهات الحركة والحالة الأمنية', style: TextStyle(fontSize: 12, color: Colors.grey)),
            value: pushNotifications,
            activeColor: Colors.blue,
            onChanged: (val) => setState(() => pushNotifications = val),
          ),
          SwitchListTile(
            title: const Text('التنبيهات الصوتية', style: TextStyle(color: Colors.white)),
            subtitle: const Text('تشغيل صوت إنذار عند حدوث طارئ', style: TextStyle(fontSize: 12, color: Colors.grey)),
            value: soundAlerts,
            activeColor: Colors.blue,
            onChanged: (val) => setState(() => soundAlerts = val),
          ),
          const Divider(height: 30, color: Colors.grey),
          const Text('معلومات التطبيق', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 10),
          const ListTile(
            leading: Icon(Icons.info, color: Colors.white70),
            title: Text('إصدار التطبيق', style: TextStyle(color: Colors.white)),
            trailing: Text('v2.1.0', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.security, color: Colors.white70),
            title: Text("Eagle's Eye Security System", style: TextStyle(color: Colors.white)),
            subtitle: Text('جميع الحقوق محفوظة', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}