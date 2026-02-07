import 'package:flutter/material.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/product.dart';

class ProductGridWidget extends StatelessWidget {
  final List<Product> products;

  const ProductGridWidget({this.products = const [], super.key});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('Aucun produit disponible'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Déterminer le nombre de colonnes en fonction de la largeur disponible
        int crossAxisCount = 2;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 5;
        } else if (constraints.maxWidth > 900) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 3;
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasPromo =
        product.salePrice != null && product.salePrice! < product.price;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du produit
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  product.thumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, size: 40)),
                ),
                if (hasPromo)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'PROMO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Infos produit
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (hasPromo) ...[
                      Text(
                        '${product.salePrice!.toStringAsFixed(2)}€',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.price.toStringAsFixed(2)}€',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ] else
                      Text(
                        '${product.price.toStringAsFixed(2)}€',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.reviewsCount})',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bouton Ajouter
          ElevatedButtonTheme(

            data: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: product.stock > 0
                    ? theme.colorScheme.primary
                    : Colors.grey.shade400,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: product.stock > 0 ? () {} : null,
                  icon: const Icon(Icons.add_shopping_cart, size: 16),
                  label: Text(
                    product.stock > 0 ? 'Ajouter' : 'Rupture',
                    style: TextStyle(fontSize: 14, ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
