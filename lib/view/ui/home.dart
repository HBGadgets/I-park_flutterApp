import 'package:flutter/material.dart';

import '../../chat_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                    Image.network(
                      'https://s3-alpha-sig.figma.com/img/69ea/eaa6/85c65e5de97d11f6b062d82c9b918b00?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=nGiUFhUPiPY8mV0iQzX3DX-flOgsNFoKe71SQib9EEywffr9e3ifJ5UxcebOJD~6jl8zqrAMU5MA7ZStlmdK9CnVp95qMcHkjZ85FmhmwCz1Ft6P37tI844Kj4Krki8BPVZHvdTUhhzU~hR5JO7~VLXPLfuKMf1rze9-4EZBKtFrMpHX7-g06Q7N0RtjnGk88WHrsN0pcJoaXso2omqAcIbQBgWag~UGi8ejv3NomSOlTn59QFC1erH299R-n2H5PHLY60XvWN1aFMvKMe-zZknMGG2lz1Z7RtbPk5IFcnd~3QJTNy2QP3aisHGxSQBE4D~I1Q5fPDbm80gTHavCXg__',
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
      ),
      bottomNavigationBar: Container(
        height: 82,
        width: 441,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history, color: Colors.white), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
