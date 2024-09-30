import 'package:flutter/material.dart';
import 'package:ppam_kuis/pages/page_login.dart';
import 'package:ppam_kuis/pages/page_order.dart';
import 'package:ppam_kuis/datastore/foods.dart';

class PageHome extends StatefulWidget {
  final String username;

  const PageHome({
    super.key,
    required this.username,
  });

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PageLogin();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.4,
              child: Image.network(
                "https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/banner/bg_banner.webp",
              ),
            ),
          ),
          const Text("Makanan"),
          Expanded(
            child: _listBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        var food = foods[index];

        return ListTile(
          title: Text(food["name"] ?? ""),
          subtitle: Text(food["description"] ?? ""),
          trailing: Text("Rp.${food["price"] ?? ""}"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PageOrder(foodIndex: index);
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selamat datang, ${widget.username}!"),
        const Text("Mau makan apa hari ini?"),
      ],
    );
  }
}
