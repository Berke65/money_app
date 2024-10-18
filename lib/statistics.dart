import 'package:flutter/material.dart';
import 'package:money_app/HomePage.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MoneyApp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
              Icon(Icons.monetization_on)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => _showBottomSheet(context),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: buildBottomAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              _buildPromiseItem('Aylık Gelir ve Gider Takibi', Icons.attach_money),
              _buildPromiseItem('Kişisel Bütçeleme Araçları', Icons.account_balance_wallet),
              _buildPromiseItem('Tasarruf Hedefleri Belirleme', Icons.savings),
              _buildPromiseItem('Gelir-Gider Raporlama', Icons.bar_chart),
              _buildPromiseItem('Finansal Hedeflerinizi İzleme', Icons.trending_up),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromiseItem(String promise, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2, // Kart gölgesi azaltıldı
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Padding azaltıldı
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.black54, size: 20), // İkon boyutu küçültüldü
                  const SizedBox(width: 8), // İkon ve metin arasında boşluk
                  Text(
                    promise,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87), // Koyu renk ve boyut ayarı
                  ),
                ],
              ),
              const Icon(Icons.check, size: 20, color: Colors.green), // Onay ikonu boyutu küçültüldü
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavItem(context, Icons.home_outlined, 'AnaSayfa', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );          }),
          _buildBottomNavItem(context, Icons.show_chart_outlined, 'İstatistik', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StatisticsPage(),
              ),
            );
          }),
          _buildBottomNavItem(context, Icons.person_2_outlined, 'Hesabım', () {
            // Hesabım sayfasına yönlendirme
          }),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: Colors.white),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 12, // Font boyutu küçültüldü
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    // Alt kısımda gösterilecek butonun fonksiyonu
  }
}
