import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageListClientes extends StatefulWidget {
  PageListClientes({super.key});

  @override
  State<PageListClientes> createState() => _PageListClientesState();
}

class _PageListClientesState extends State<PageListClientes> {
  List<String> clients = [
    'Amanda',
    'Bruno',
    'Diego',
    'Carlos',
    'Flavio',
    'Gil',
    'Helio',
  ];
  List<String> result = [];

  @override
  void initState() {
    clients.sort(
      (a, b) => a.compareTo(b),
    );
    result = clients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Row(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    size: 20,
                    Icons.search,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Pesquisar...'),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          result = clients;
                        } else {
                          result = clients
                              .where((client) => client
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        }
                      });
                    },
                  ),
                )
              ]),
            ),
            Flexible(
                child: result.isEmpty
                    ? const Text('Nenhum cliente encontrado')
                    : ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text(result[index][0]),
                                ),
                                title: Text(result[index]),
                              ),
                              const Divider()
                            ],
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
