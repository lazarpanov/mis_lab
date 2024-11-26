import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Clothing {
  String name;
  String image;
  String description;
  double price;

  Clothing({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '213233',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '213233'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Clothing> clothes = [
    Clothing(
      name: 'Tux',
      image:
      'https://assets.woolworthsstatic.co.za/Slim-Fit-Glam-Suit-Jacket-BLACK-506989218-top.jpg?V=cDzf&o=eyJidWNrZXQiOiJ3dy1vbmxpbmUtaW1hZ2UtcmVzaXplIiwia2V5IjoiaW1hZ2VzL2VsYXN0aWNlcmEvcHJvZHVjdHMvYWx0ZXJuYXRlLzIwMjMtMDctMDUvNTA2OTg5MjE4X0JMQUNLX3RvcC5qcGcifQ&q=75',
      description: 'Suitable for every occasion',
      price: 412.12,
    ),
    Clothing(
      name: 'Pants',
      image:
      'https://img01.ztat.net/article/spp-media-p1/a709a0a032df42edb396a93622e3d867/f5bea56f73c74dadb10f9a4a22cde836.jpg?imwidth=762&filter=packshot',
      description: 'Pants for every occasion',
      price: 109.99,
    ),
    Clothing(
      name: 'Tie',
      image:
      'https://5.imimg.com/data5/NX/DT/MY-41982547/mens-tie-1000x1000.jpg',
      description: 'Tie for every occasion',
      price: 15.99,
    ),
    Clothing(
      name: 'White Shirt',
      image:
      'https://cdn.shopify.com/s/files/1/0223/4377/8384/files/SHI139S22_White_1_85702db1-d266-4f4b-80ae-ae4d57911a9e_600x600.jpg?v=1719801577',
      description: 'Shirt for every occasion',
      price: 55.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final clothing = clothes[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(clothing.image, width: 50, height: 50),
              title: Text(clothing.name),
              subtitle: Text('\$${clothing.price.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothingDetailScreen(clothing: clothing),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final Clothing clothing;

  const ClothingDetailScreen({Key? key, required this.clothing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothing.name),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(clothing.image),
            const SizedBox(height: 16),
            Text(
              clothing.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              clothing.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${clothing.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
