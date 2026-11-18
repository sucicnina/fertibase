
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('O aplikaciji')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Zašto ova aplikacija?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Aplikacija je informativni alat za poljoprivrednike i proizvođače hrane. '
              'Omogućuje pregled gnojiva po nazivu, N-P-K strukturi, vrsti i proizvođaču, '
              'te brzu usporedbu sastava i opisa proizvođača. '
              'Filtri su oblikovani po uzoru na web pretragu Agrokluba.',
            ),
            SizedBox(height: 16),
            Text('Napomena', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Podaci se učitavaju iz lokalne JSON baze (assets/fertilizers.json). '
              'U konačnoj verziji moguće je zamijeniti izvor podataka API-jem.',
            ),
          ],
        ),
      ),
    );
  }
}
