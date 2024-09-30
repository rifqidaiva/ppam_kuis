import 'package:flutter/material.dart';
import 'package:ppam_kuis/datastore/foods.dart';

class PageOrder extends StatefulWidget {
  final int foodIndex;

  const PageOrder({
    super.key,
    required this.foodIndex,
  });

  @override
  State<PageOrder> createState() => _PageOrderState();
}

class _PageOrderState extends State<PageOrder> {
  final _amountController = TextEditingController();
  var _totalPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp",
              width: 200,
              height: 200,
            ),
            Text(
              foods[widget.foodIndex]["name"] ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Rp.${foods[widget.foodIndex]["price"] ?? "0"}",
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Jumlah",
              ),
            ),
            Text("Rp.${_totalPayment.toString()}"),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _totalPayment =
                        int.parse(foods[widget.foodIndex]["price"] ?? "0") *
                            int.parse(_amountController.text.isEmpty
                                ? "0"
                                : _amountController.text);
                  },
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Pesanan berhasil!"),
                  ),
                );
              },
              child: const Text("Order"),
            ),
          ],
        ),
      ),
    );
  }
}
