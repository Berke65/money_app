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
  late PageController _pageController;
  int currentIndex = 0; // Görüntülenen dairenin indeksi

  // Dairelere ait veriler
  final List<Map<String, dynamic>> circleData = [
    {
      "color": Colors.blue,
      "progressColor": Colors.blueAccent,
      "text": "Aylık Gelir",
      "value": 0.45,
      "number": 1500,
    },
    {
      "color": Colors.red,
      "progressColor": Colors.redAccent,
      "text": "Aylık Gider",
      "value": 0.35,
      "number": 1200,
    },
    {
      "color": Colors.green,
      "progressColor": Colors.greenAccent,
      "text": "Toplam",
      "value": 1.0,
      "number": 2700,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          onPressed: () {},
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
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: circleData.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 20.0,
                          animation: true,
                          percent: circleData[index]['value'],
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: circleData[index]['progressColor'],
                          backgroundColor: circleData[index]['color']
                              .withOpacity(0.3), // Daha açık ton
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              circleData[index]['text'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${(circleData[index]['value'] * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (currentIndex == 0) ...[
              Text(
                'Aylık Gelir: \$${circleData[0]['number']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ] else if (currentIndex == 1) ...[
              Text(
                'Aylık Gider: \$${circleData[1]['number']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ] else if (currentIndex == 2) ...[
              Text(
                'Toplam: \$${circleData[2]['number']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(height: 20),
            // Slider noktaları
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(circleData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
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
                  Icons.home_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'İşlemlerim',
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
                  Icons.message_outlined,
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
}
