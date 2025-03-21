import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}}'),
      ),
      body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        builder: (context, state) {
          if (state is {{name.pascalCase()}}Initial) {
            // Carga inicial
            context.read<{{name.pascalCase()}}Cubit>().fetchAll{{name.pascalCase()}}();
            return const Center(child: CircularProgressIndicator());
          } else if (state is {{name.pascalCase()}}Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is {{name.pascalCase()}}Loaded) {
            final items = state.{{name.camelCase()}}s;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  // Añadir más acciones según sea necesario
                );
              },
            );
          } else if (state is {{name.pascalCase()}}Error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Estado desconocido'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}