import 'package:flutter/material.dart';
import 'cart.dart';
import 'product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get total => widget.cart.fold(0, (sum, item) => sum + item.precio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: widget.cart.isEmpty
          ? const Center(child: Text('Tu carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final producto = widget.cart[index];
                      return ListTile(
                        leading: Image.network(producto.imagenUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(producto.titulo),
                        subtitle: Text('${producto.precio.toStringAsFixed(2)} €'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              Cart().removeProduct(producto);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Total: ${total.toStringAsFixed(2)} €',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Compra finalizada'),
                              content: const Text('Compra realizada correctamente. ¡Gracias!'),
                              actions: [
                               
                                TextButton(
                                  onPressed: () {
            
                                    Navigator.of(ctx).pop();
                                    Navigator.of(context).pop(); // Regresa al HomeScreen o pantalla anterior
                                  },
                                  child: const Text('Seguir comprando'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Cart().clearCart(); // Limpiar el carrito
                                    });
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Finalizar compra'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
