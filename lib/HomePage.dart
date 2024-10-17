import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

  String amount = "0.00";
  String selectedTip = "cash";
  String selectedCategory = "Food";
  String selectedCurrency = "\$"; // Başlangıç para birimi

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
          onPressed: _showAddExpensePopup,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: buildBottomAppBar(),
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

  Widget buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.black,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              // this page
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'AnaSayfa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              // yönlendirme işlemleri
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.data_array,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'İstatistik',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              // yönlendirme işlemleri
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'Hesabım',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddExpensePopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 500,
          child: Column(
            children: [
              // Kategoriler
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    items: <String>['Food', 'Transport', 'Shopping', 'Entertainment']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Kategori seçimi
                    },
                    hint: const Text("Select Category"),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedTip = "cash";
                        }),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selectedTip == "cash" ? Colors.blue[100] : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Cash", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedTip = "card";
                        }),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selectedTip == "card" ? Colors.blue[100] : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Card", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '$selectedCurrency$amount',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index < 9) {
                            amount = (int.parse(amount.replaceAll("\$", "").replaceAll(",", "")) * 10 + (index + 1)).toString();
                            amount = amount.padLeft(5, '0');
                          } else if (index == 9) {
                            // Silme işlemi
                            amount = amount.length > 4 ? amount.substring(0, amount.length - 1) : "0.00";
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          index < 9 ? (index + 1).toString() : '⌫', // Silme butonu
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Para birimini değiştir
                      setState(() {
                        selectedCurrency = selectedCurrency == "\$" ? "€" : "\$"; // $ ile € arasında geçiş
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("Change Currency", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Harcamayı ekleme mantığı
                      Navigator.pop(context);
                    },
                    child: const Text("✓"), // Onay butonu
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

}