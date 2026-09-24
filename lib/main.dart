import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق الحجز'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          onPressed: () {
            // هنا ممكن نضيف الكود اللي هيغرد أو يبعت الحجز للتطبيق الثاني بعدين
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم إرسال حجز الـ M بنجاح!')),
            );
          },
          child: const Text(
            'حجز الـ M',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
