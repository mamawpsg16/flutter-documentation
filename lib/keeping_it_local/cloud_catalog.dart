import 'package:flutter/material.dart';
import './theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'sqlite_page.dart';

class CloudItem {
  final String name;
  final String price;
  final String imageUrl;

  CloudItem({required this.name, required this.price, required this.imageUrl});
}


class CloudCatalogScreen extends StatelessWidget {
  const CloudCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using online images instead of assets
    final List<CloudItem> clouds = List.generate(
      20,
      (index) => CloudItem(
        name: 'Cloud ${index + 1}',
        price: '\$${(15 + (index % 15)).toStringAsFixed(2)}',
        imageUrl: 'https://picsum.photos/200?random=$index',  // Simple reliable image service with cache busting
      ),
    );


    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keeping. It. Local.'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: clouds.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CloudCard(cloud: clouds[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.toggleTheme(!themeProvider.isDarkMode);
        },
        child: Icon(
          themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }
}

class CloudCard extends StatelessWidget {
  final CloudItem cloud;

  const CloudCard({super.key, required this.cloud});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            // Using CachedNetworkImage for network images with caching
            AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: cloud.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.blue.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.withOpacity(0.3),
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cloud.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cloud.price,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}  