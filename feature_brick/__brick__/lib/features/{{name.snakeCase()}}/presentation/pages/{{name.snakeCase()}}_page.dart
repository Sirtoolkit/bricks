import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_cubit.dart';

class {{name.pascalCase()}}Page extends StatefulWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends State<{{name.pascalCase()}}Page> {
  @override
  void initState() {
    super.initState();
    context.read<{{name.pascalCase()}}Cubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<{{name.pascalCase()}}Cubit>().findAll();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text('{{name.pascalCase()}}'),
                Expanded(
                  child: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
                    builder: (_, state) {
                      return switch (state) {
                        {{name.pascalCase()}}StateLoading() => const Center(child: CircularProgressIndicator()),
                        {{name.pascalCase()}}StateError() => const Center(child: Text('Error')),
                        {{name.pascalCase()}}StateLoaded() => ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            shrinkWrap: true,
                            itemCount: state.{{name.snakeCase()}}.length,
                            itemBuilder: (context, i) {
                              final item = state.{{name.snakeCase()}}[i];
                              return ListTile(title: Text(item.name));
                            },
                          ),
                        _ => Container(),
                      };
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
