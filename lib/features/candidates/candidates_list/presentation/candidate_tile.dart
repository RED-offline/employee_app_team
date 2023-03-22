import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_app_team/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({super.key});

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
            ),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://robohash.org/mollitiarerumdolor.png?size=300x300&set=set1'), //candidate.image!
                      fit: BoxFit.cover,
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
                        children: const [
                          Text(
                            ' candidate.name!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              'candidate.surname!',
                              style: TextStyle(
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
                        ' candidate.position!',
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
