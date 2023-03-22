import 'package:flutter/material.dart';

class CandidateDetailWidget extends StatelessWidget {
  const CandidateDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('context.l10n.detailAppBarTitle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Hero(
                      tag: 'avatar {candidate.id}',
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        elevation: 10,
                        shadowColor: Colors.blueGrey.withOpacity(0.6),
                        child: Image.network(
                          'https://robohash.org/mollitiarerumdolor.png?size=300x300&set=set1',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '{candidate.name!} {candidate.surname!}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'candidate.position!',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _tittleandinfo(
                    'Email:',
                    'lucien.runolfsdottir@email.com',
                  ),
                  const SizedBox(height: 10),
                  _tittleandinfo('Phone:', '+372 441.523.4205'),
                  const SizedBox(height: 10),
                  _tittleandinfo('Date of Birth:', '1983-11-26'),
                  const SizedBox(height: 10),
                  _tittleandinfo('City:', 'New Norbertomouth'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _tittleandinfo(String tittle, String info) {
    return Row(
      children: [
        Text(
          tittle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
