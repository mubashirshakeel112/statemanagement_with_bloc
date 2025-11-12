import 'package:bloc_example_03/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

/// A modern home screen with a search bar, a horizontal list of categories,
/// and a vertical list of featured items.
class HomeView extends StatelessWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        toolbarHeight: 70,
        scrolledUnderElevation: 0,
        title: Text(
          'Discover',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: theme.colorScheme.onSurface),
            onPressed: () {
              // Handle notifications
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(theme),
          const SizedBox(height: 24.0),
          _buildSectionHeader(context, 'Categories'),
          const SizedBox(height: 16.0),
          _buildCategoryList(),
          const SizedBox(height: 24.0),
          _buildSectionHeader(context, 'Featured'),
          const SizedBox(height: 16.0),
          _buildFeaturedItem(theme),
          const SizedBox(height: 16.0),
          _buildFeaturedItem(theme, isReversed: true),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for anything...',
        hintStyle: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6)),
        prefixIcon: Icon(Icons.search, color: theme.colorScheme.onSurface.withOpacity(0.6)),
        filled: true,
        fillColor: theme.colorScheme.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'See All',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    final categories = {'Art': Icons.palette, 'Music': Icons.music_note, 'Travel': Icons.airplanemode_active, 'Food': Icons.restaurant};
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.entries.map((entry) {
          return _buildCategoryItem(entry.key, entry.value, (categories.keys.toList().indexOf(entry.key) * 0.1).toDouble());
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, double colorFactor) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Color.lerp(Colors.blue.shade100, Colors.purple.shade100, colorFactor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8.0),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(ThemeData theme, {bool isReversed = false}) {
    const imageUrl = 'https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80';

    Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageUrl, height: 180, width: 150, fit: BoxFit.cover),
    );

    Widget description = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Modern Interior', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            'A beautiful and serene living space with a touch of modern design.',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text('4.8', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: isReversed
              ? [description, const SizedBox(width: 16), image]
              : [image, const SizedBox(width: 16), description],
        ),
      ),
    );
  }
}
