import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoYWUM5Lpw8wwHe5aK6e9R4o1OOwI4XRsPLg&s?auto=compress&cs=tinysrgb&w=600',
      'title': 'Pizza',
      'subtitle': 'Cheesy Pepperoni',
      'price': '\$12',
      'rating': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1585032226651-759b368d7246?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2hpbmVzZSUyMGZvb2R8ZW58MHx8MHx8fDA%3D?auto=compress&cs=tinysrgb&w=600',
      'title': 'Chinese Food',
      'subtitle': 'Sweet & Sour Chicken',
      'price': '\$10',
      'rating': 4,
    },
    {
      'image':
          'https://asset.kompas.com/crops/dJ6juHNfurURWuXvaqPXge-977c=/53x36:933x623/1200x800/data/photo/2021/10/21/6171492e1ea12.jpg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Burger',
      'subtitle': 'Double Beef Patty',
      'price': '\$9',
      'rating': 4,
    },
    {
      'image':
          'https://images.pexels.com/photos/3026806/pexels-photo-3026806.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Dessert',
      'subtitle': 'Choco Lava Cake',
      'price': '\$6',
      'rating': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${items[index]['title']}')),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      items[index]['image'],
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    items[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    items[index]['subtitle'],
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        color:
                            i < items[index]['rating']
                                ? Colors.orange
                                : Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        items[index]['price'],
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.favorite_border, color: Colors.red, size: 16),
                    ],
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
