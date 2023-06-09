import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_app_team/features/candidates/candidate_detail/utils/mail_app_launcher.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:employee_app_team/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CandidateDetailWidget extends StatelessWidget {
  const CandidateDetailWidget({required this.candidate, super.key});
  final CandidateModel candidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.l10n.detailAppBarTitle),
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
                      tag: candidate.uid!,
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        elevation: 10,
                        shadowColor: Colors.blueGrey.withOpacity(0.6),
                        child: Image(
                          image: CachedNetworkImageProvider(
                            candidate.avatar!,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${candidate.firstName!} ${candidate.lastName!}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      candidate.employment!.title!,
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
                  GestureDetector(
                    onTap: () {
                      final mailLauncher = MailAppLauncher()
                        ..launchMailApp(candidateEmail: candidate.email!);
                    },
                    child: _tittleandinfo(
                      'Email:',
                      candidate.email!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _tittleandinfo('Phone:', candidate.phoneNumber!),
                  const SizedBox(height: 10),
                  _tittleandinfo('Username:', '@${candidate.username}'),
                  const SizedBox(height: 10),
                  _tittleandinfo('Country:', '${candidate.address!.country}'),
                  const SizedBox(height: 10),
                  _tittleandinfo('City:', candidate.address!.city!),
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
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            info,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
