import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssistancePage extends StatelessWidget {
  const AssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fbf9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9fbf9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Color(0xff121811)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Assistance',
          style: TextStyle(
            color: Color(0xff121811),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ..._buildContactCards(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> _buildContactCards() {
    final contacts = [
      {
        'name': 'Ethan Harper',
        'designation': 'Field Supervisor',
        'address': '123 Maple Street, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAe9TRRmM0KMQjyHL7LPpt3b4Cny5llKC0iz2bJHmz3KrYpc-D61ap10HBIucQUVC3OaO1rNRPzs3zJAJ_vBquHDxQIlXOacI6CIxHYuK344YjtlRAsfxhJsc_CYsXvOkZYPY1MGh4fxWdPT66i0J6DSCxErFKSeDKfY9vgfSxEU8UDG-elT3oMqrJLGdZwaXmukjRt4lg7Do2JEaWUGn8KLltiH0Fg6t1GCnEhSpfMX0ncJVVYouftxw7tLSBCOMGDydEP70aq6CIU',
      },
      {
        'name': 'Olivia Bennett',
        'designation': 'Agronomist',
        'address': '456 Oak Avenue, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAQBA3k8x79ob8NdB-E1Q-n0ECBPG-xANK_4weVdVxMMdT5VL1FC9LuQ2r8hf9GNi1Hjoc1RS45W5YhT5FQbfd6qBADKN0JqzKymFef4tfNAVLcaCO9sIMtjPUMOBB4lw-przdKGxphKXhlmr4ZScow23xPd0I-WfEgbJrXGZjP4d7pNGGye1O7BBLyT1c-2c85Iwn48S6ncem86-9EtP__j8ReQBNynwJ8_S7dyzGM6-j5CoWhplCMn-0bhlOZsjzb4YMMzNdPWH9j',
      },
      {
        'name': 'Noah Carter',
        'designation': 'Irrigation Specialist',
        'address': '789 Pine Lane, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDFAzldnY25ljSQIe2naMcb54fEFTH5Dmp4-199INFkfOSOivP8wa1nCQnWzKUvpZ9qAeK15FIXaB8X2DyXKeHi4DoloJUWN6IV28ANufskcs23IgAhOEmC8LhgK5J0UyovQZ7wwZ1S_DxWIEIn5yhiCPsZLOeGlejMzUaGzjTZnG3y4PA0_iEPah2Jqz3D0WEwoEMGh4boY-ivJaKKDdAFt72NizzaWm5SJZBU7cpGuL23T4lY7taSYVjy0yNKZufdN92CsF5HC1Vl',
      },
      {
        'name': 'Ava Thompson',
        'designation': 'Soil Analyst',
        'address': '101 Elm Road, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAT-OqEFftGs-S-lClr9M7B7Cal1LFF8tpyjHwsfiqllobT4QPjCBfO9m2OW8ZPwGMqUkYMPUHUoFs8ssmvBcidICAU173E9jLYOfN1ohQGWvfOO36llYfqdiZTE460nIH0E-Oz8QocFxRq3YjXpcYVH_LPlWmCZlFPdCqVVrGhGNNn3p6h6gLgwYMG3odAYhLdL6Qcv-K9A2qZ5A3Put7Wal6a74h0CoIWxaHglDv4FHW2eBUwBrDcY_qtmW9hUn7Y2GihjHHnfVMY',
      },
    ];

    return contacts.map((contact) {
      return Column(
        children: [
          Container(
            color: const Color(0xfff9fbf9),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    contact['image']!,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name']!,
                        style: const TextStyle(
                          color: Color(0xff121811),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        contact['designation'] ?? '',
                        style: const TextStyle(
                          color: Color(0xff3b5c36),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contact['address']!,
                        style: const TextStyle(
                          color: Color(0xff64875e),
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xffaddda6),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Contact Now',
                      style: TextStyle(
                        color: Color(0xff121811),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xffebf0ea),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Message Now',
                      style: TextStyle(
                        color: Color(0xff121811),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0, color: Colors.transparent),
        ],
      );
    }).toList();
  }
}
