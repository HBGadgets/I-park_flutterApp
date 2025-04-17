import 'package:flutter/material.dart';

import '../../chat_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              'Home',
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
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(text: 'Home',icon: Icon(Icons.home,size: 30,color: Colors.white,)),
                  Tab(text: 'History',icon: Icon(Icons.history,size: 30,color: Colors.white),),
                  Tab(text: 'Profile',icon: Icon(Icons.person,size: 30,color: Colors.white),),
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
                color: Colors.white,
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/qr.png',
                    width: 259,
                    height: 259,
                  ),
                  const Text(
                    'Scan QR',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              ChatItem('MH36A6678', 'I Need my car in 30 min'),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
              ChatItem('MH36A6678', 'I Need my car in 5 min'),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
              ChatItem('MH36A6678', 'I Need my car in 30 min'),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildHistoryTab() {
    return Center(
      child: Text('History Tab Content'),
    );
  }

  Widget buildProfileTab() {
    return Center(
      child: Text('Profile Tab Content'),
    );
  }
}