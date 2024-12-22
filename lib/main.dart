import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penanganan Hama',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 106, 255, 52), // Warna hijau utama
        appBarTheme: AppBarTheme(
          backgroundColor:
              Color.fromARGB(255, 106, 255, 52), // Menyesuaikan warna app bar
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              Color.fromARGB(255, 106, 255, 52), // Warna tombol aksi melayang
        ),
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Colors.black), // bodyText1 diganti bodyLarge
          bodyMedium:
              TextStyle(color: Colors.black), // bodyText2 diganti bodyMedium
          titleLarge:
              TextStyle(color: Colors.white), // headline6 diganti titleLarge
        ),
      ),
      home: HamaListPage(),
    );
  }
}

class HamaListPage extends StatelessWidget {
  final List<Map<String, String>> hamaList = [
    {
      'name': 'Kutu Daun',
      'description': 'Serangga kecil penyebab kerusakan daun.',
      'image': 'assets/kutu_daun.png'
    },
    {
      'name': 'Ulat Tanah',
      'description': 'Merusak batang tanaman di malam hari.',
      'image': 'assets/ulat_tanah.png'
    },
    {
      'name': 'Wereng Batang Coklat',
      'description': 'Penyebab tanaman kering dan mati.',
      'image': 'assets/wereng_batang_coklat.png'
    },
    {
      'name': 'Hama Tikus',
      'description': 'Memakan biji dan akar tanaman.',
      'image': 'assets/hama_tikus.png'
    },
    {
      'name': 'Belalang',
      'description': 'Memakan daun dan menghambat pertumbuhan.',
      'image': 'assets/belalang.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penanganan Hama'),
      ),
      body: ListView.builder(
        itemCount: hamaList.length,
        itemBuilder: (context, index) {
          final hama = hamaList[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white, // Warna latar belakang kartu
            child: ListTile(
              leading: Image.asset(
                hama['image'] ?? '',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                hama['name'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4CAF50), // Warna teks nama hama
                ),
              ),
              subtitle: Text(
                hama['description'] ?? '',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF4CAF50)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HamaDetailPage(hama: hama),
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

class HamaDetailPage extends StatelessWidget {
  final Map<String, String> hama;

  HamaDetailPage({required this.hama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hama['name'] ?? 'Detail Hama'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar hama yang diunggah
              Image.asset(
                'assets/hama_image.png', // Gambar yang diunggah
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                hama['name'] ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4CAF50), // Warna teks nama hama
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Solusi Penanganan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                '1. Gunakan metode alami seperti pestisida organik.\n'
                '2. Rutin memeriksa tanaman setiap pagi.\n'
                '3. Gunakan predator alami untuk hama ini.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
