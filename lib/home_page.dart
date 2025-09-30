import 'package:flutter/material.dart';
import 'vehicle-data.dart';
import 'detail_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Selamat datang, $username"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vehicleList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final vehicle = vehicleList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: ClipOval(
                child: Image.network(
                  vehicle.imageUrls[0],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.teal.shade100,
                    width: 60,
                    height: 60,
                    child: const Icon(Icons.directions_car,
                        size: 32, color: Colors.teal),
                  ),
                ),
              ),
              title: Text(
                vehicle.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(vehicle.type),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(vehicle: vehicle),
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
