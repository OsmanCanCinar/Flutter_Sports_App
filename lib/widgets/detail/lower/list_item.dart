import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

class ListItem extends StatelessWidget {
  const ListItem({
    required this.videoInfo,
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;
  final List videoInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        videoInfo[index]['thumbnail'],
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  for(int i = 0; i < 70; i++)
                  i.isEven?Container(
                    width: 3,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFF839fed),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ) : Container(
                    width: 3,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
