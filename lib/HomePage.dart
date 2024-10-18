import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:money_app/statistics.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dairelere ait veriler
  final List<Map<String, dynamic>> circleData = [
    {
      "color": Colors.blue,
      "progressColor": Colors.blueAccent,
      "text": "Aylık Gelir",
      "value": 0.45,
    },
    {
      "color": Colors.red,
      "progressColor": Colors.redAccent,
      "text": "Aylık Gider",
      "value": 0.35,
    },
    {
      "color": Colors.green,
      "progressColor": Colors.greenAccent,
      "text": "Toplam",
      "value": 0.82,
    },
  ];

  // Harcamalar
  final List<Map<String, dynamic>> expenses = [
    {
      "category": "Food",
      "amount": 498.50,
      "icon": Icons.fastfood,
      "iconColor": Colors.orange,
      "tip": "card"
    },
    {
      "category": "Shopping",
      "amount": 344.45,
      "icon": Icons.shopping_cart,
      "iconColor": Colors.green,
      "tip": "cash"
    },
    {
      "category": "Gifts",
      "amount": 230.50,
      "icon": Icons.card_giftcard,
      "iconColor": Colors.pink,
      "tip": "card"
    },
    {
      "category": "Transport",
      "amount": 100.00,
      "icon": Icons.directions_car,
      "iconColor": Colors.blue,
      "tip": "cash"
    },
    {
      "category": "Entertainment",
      "amount": 75.00,
      "icon": Icons.movie,
      "iconColor": Colors.purple,
      "tip": "cash"
    },
  ];

  String selectedCategory = 'Seçiniz';
  String amount = '';
  String paymentMethod = 'Cash'; // Default olarak 'Cash' seçili
  final List<String> categories = ['Seçiniz', 'Kategori 1', 'Kategori 2', 'Kategori 3'];

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Daireler
            SizedBox(
              height: 150,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(circleData.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 14.0,
                          animation: true,
                          percent: circleData[index]['value'],
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: circleData[index]['progressColor'],
                          backgroundColor: circleData[index]['color']
                              .withOpacity(0.3),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          circleData[index]['text'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  })),
            ),
            // Kumbaranız kısmı
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.savings, size: 40, color: Colors.amber),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kumbaranız',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Toplam Birikim: \$1,200.00',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          elevation: 0,
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                color: expenses[index]['iconColor'].withOpacity(
                                    0.2), // Çerçevenin rengi
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(8),
                              // Çerçeve içi boşluk
                              child: Icon(
                                expenses[index]['icon'],
                                color: Colors.black, // İkon rengi
                                size: 30, // İkon boyutu
                              ),
                            ),
                            title: Text(expenses[index]['category']),
                            subtitle: Text(expenses[index]['tip']),
                            trailing: Text(
                              '-\$${expenses[index]['amount'].toStringAsFixed(
                                  2)}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17.0),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100), // Bu alanda kaydırma ekleyin
                  ],
                ),
              ),
            ),
          ],
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
          _buildBottomNavItem(context, Icons.home, 'AnaSayfa', () {
            // AnaSayfa'ya yönlendirme
          }),
          _buildBottomNavItem(context, Icons.show_chart, 'İstatistik', () {
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
                top: 32,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    size: 48,
                    color: Colors.blue,
                  ), // Larger, outlined add icon
                  const SizedBox(height: 16),
                  const Text(
                    'Yeni Harcama Ekle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Category Selection with Icon
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.category), // Category icon
                      labelText: 'Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), // Rounded border
                      filled: true,
                      fillColor: Colors.grey[200], // Soft background color
                    ),
                    items: categories
                        .map((category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Amount Input with Icon
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.attach_money), // Amount icon
                      labelText: 'Miktar',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Payment Method Selection with Icons
                  const Text(
                    'Ödeme Yöntemi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ToggleButtons(
                    isSelected: [
                      paymentMethod == 'Cash',
                      paymentMethod == 'Card'
                    ],
                    onPressed: (int index) {
                      setState(() {
                        paymentMethod = index == 0 ? 'Cash' : 'Card';
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    fillColor: Colors.blue[100], // Soft fill color
                    selectedColor: Colors.blue,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(Icons.money),
                            SizedBox(width: 8),
                            Text('Nakit'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card),
                            SizedBox(width: 8),
                            Text('Kart'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // "Tamam" Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle submission logic here
                    },
                    child: const Text('Tamam'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

}