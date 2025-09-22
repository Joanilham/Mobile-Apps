import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final int price;
  int quantity;

  MenuItem({required this.name, required this.price, this.quantity = 0});
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<MenuItem> _menuItems = [
    MenuItem(name: 'Chicken Goreng', price: 15000),
    MenuItem(name: 'Kentang Fries', price: 13000),
    MenuItem(name: 'Es Teh Panas', price: 7000),
    MenuItem(name: 'Jus Strawberry Rasa Coklat', price: 7000),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _menuItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_menuItems[index].quantity > 0) {
        _menuItems[index].quantity--;
      }
    });
  }

  void _resetQuantities() {
    setState(() {
      for (var item in _menuItems) {
        item.quantity = 0;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua pesanan telah direset.'),
          backgroundColor: Colors.blue,
        ),
    );
  }

  void _showTransactionSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Transaksi Berhasil!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MENUS', style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Makanan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                ...List.generate(2, (index) {
                  final item = _menuItems[index];
                  return ListTile(
                    leading: Text('${item.quantity}', style: const TextStyle(fontSize: 18)),
                    title: Text(item.name),
                    subtitle: Text('Rp. ${item.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _decrementQuantity(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _incrementQuantity(index),
                        ),
                      ],
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Minuman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                ...List.generate(2, (index) {
                  final item = _menuItems[index + 2];
                  return ListTile(
                    leading: Text('${item.quantity}', style: const TextStyle(fontSize: 18)),
                    title: Text(item.name),
                    subtitle: Text('Rp. ${item.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _decrementQuantity(index + 2),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _incrementQuantity(index + 2),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showTransactionSuccess,
                    child: const Text('Transaction', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _resetQuantities,
                    child: const Text('Reset', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(Icons.arrow_back_ios),
            Text('Previous'),
            Spacer(),
            Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text('2'),
            SizedBox(width: 10),
            Text('...'),
            SizedBox(width: 10),
            Text('4'),
            Spacer(),
            Text('Next'),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}