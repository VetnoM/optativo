import 'package:flutter/material.dart';
import 'list_data.dart';
import 'product_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda los Hermanos')),
  body: ListView.builder(
  itemCount: productos.length,
  itemBuilder: (context, index) {
    final producto = productos[index];
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetail(producto: producto),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen más grande
            Image.network(
              producto.imagenUrl,
              height: 250, // Aumentado
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(producto.titulo,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${producto.precio.toStringAsFixed(2)} €',
                      style: const TextStyle(fontSize: 16, color: Colors.teal)),
                  const SizedBox(height: 4),
                  Text(producto.descripcionCorta),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
),

    );
  }
}
