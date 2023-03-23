import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_app_team/features/candidates/candidates_list/data/models/candidate_model.dart';
import 'package:employee_app_team/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({required this.candidate, super.key});
  final CandidateModel candidate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 2,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20,
          shadowColor: Colors.blueGrey.withOpacity(0.4),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => context.goNamed(
              MyAppRouteConstants.detailRouteName,
              extra: candidate,
            ),
            child: Row(
              children: [
                Hero(
                  tag: 'avatar ${candidate.uid}',
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                    imageUrl: candidate.avatar!,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 200,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            candidate.firstName!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              candidate.lastName!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        candidate.employment!.title!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
