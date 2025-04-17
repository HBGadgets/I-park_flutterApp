import 'package:flutter/material.dart';
import '../../chat_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  int selectedTabIndex = 0;

  final List<String> appBarTitles = ['Home', 'History', 'Profile'];

  void onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.black,
            leading: Icon(Icons.menu, color: Colors.white),
            title: Text(
              appBarTitles[selectedTabIndex],
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            centerTitle: true,
            actions: [Icon(Icons.notifications, color: Colors.white)],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildHomeTab(),
                  buildHistoryTab(),
                  buildProfileTab(),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withAlpha(153),
                onTap: onTabChanged,
                tabs: const [
                  Tab(
                    text: 'Home',
                    icon: Icon(Icons.home, size: 30, color: Colors.white),
                  ),
                  Tab(
                    text: 'History',
                    icon: Icon(Icons.history, size: 30, color: Colors.white),
                  ),
                  Tab(
                    text: 'Profile',
                    icon: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeTab() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 382,
              width: 345,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://s3-alpha-sig.figma.com/img/3724/daab/670a68c69346a58344a30f1ba22d1020?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ZdUsdNrTdIst1-a~3bP9ER-eezMFl4w-7KLmr1A79KEU18n-yIZ3PYJba7LsMxJ0~r9dy8t0H8ML8EtvjWHKBmTH25FfxBm0E0rS3PYBqlTTy6jeMHpQBZOf6tO58K7knZb9ANaecD9fzgzRVuZbKvSvkK4s0Iq8kR1Gm9yfi29~GE0tvVuVvvykCVtGjZk5s5x3E4yvKaXs8x6m5KK0YZ-qsaO-~kvTi~aOxQSkh7YF7otQDMqgpG4EcyV0L0JnvJBoLB3laGcEs3TeltMRYdfN90USvw~jyBtwvYxjvxQMODPWqGPjhd7Md5AoSf6Ay-5n1Xz-KJoskP1gLnEOEg__',
                        ),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Rohan Rah',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/qr.png', width: 259, height: 259),
                  const Text(
                    'Scan QR',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: ListView(
              children: [
                ChatItem('MH36A6678', 'I Need my car in 30 min'),
                const Divider(color: Colors.black, thickness: 1, height: 15),
                ChatItem('MH36A6678', 'I Need my car in 5 min'),
                const Divider(color: Colors.black, thickness: 1, height: 15),
                ChatItem('MH36A6678', 'I Need my car in 30 min'),
                const Divider(color: Colors.black, thickness: 1, height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHistoryTab() {
    return Center(child: Text('History Tab Content'));
  }

  Widget buildProfileTab() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 90,
            backgroundImage: AssetImage(
              'assets/images/Photo by Petr Sevcovic.png',
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Rohan Rah',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.amber, size: 15),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee ID',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('EMP0001111',style: TextStyle(color: Colors.grey,fontSize: 16),),
                ],

              ),
              Column(
                children: [
                  Text(
                    'Contact no',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('+91 75484856',style: TextStyle(color: Colors.grey,fontSize: 16)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Title',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Supervisor',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feedback:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '"I recently had the pleasure of experiencing Valley Boy, and I have to say, it was an absolute delight! The music is fresh, catchy, and the lyrics are both thoughtful and relatable. Valley Boy has a unique sound that combines laid-back vibes with an edgy twist, creating a perfect balance for a variety of moods."',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
