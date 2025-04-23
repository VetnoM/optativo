import 'package:flutter/material.dart';
import 'cart.dart';
import 'cart_screen.dart';
import 'product.dart';

class ProductDetail extends StatelessWidget {
  final Product producto;

  const ProductDetail({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final cart = Cart();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda Los Hermanos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            tooltip: 'Ver carrito',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: cart.productos),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Fila con imagen y detalles
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen a la izquierda
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    producto.imagenUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                // Texto a la derecha
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        producto.titulo,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(producto.descripcionLarga),
                      const SizedBox(height: 10),
                      Text(
                        '${producto.precio.toStringAsFixed(2)} €',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Botón debajo del todo
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton.extended(
                onPressed: () {
                  cart.addProduct(producto);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Producto añadido al carrito')),
                  );
                },
                label: const Text('Añadir al carrito'),
                icon: const Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.teal,
                heroTag: 'addBtnDetail',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
