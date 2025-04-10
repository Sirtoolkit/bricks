import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:{{project_name}}/core/core.dart';
import 'package:{{project_name}}/shared/shared.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/{{name.snakeCase()}}.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('{{name.pascalCase()}} Page', style: textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () {
              context.read<{{name.pascalCase()}}Cubit>().findAll();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<{{name.pascalCase()}}Cubit>().findAll();
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxHeight: constraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<{{name.pascalCase()}}Cubit, DataState<List<{{name.pascalCase()}}Entity>>>(
                      builder: (_, state) {
                        return switch (state) {
                          DataStateLoading() => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          DataStateError(:final error, :final message) => Column(
                            children: [
                              if (error is NetworkException) ...[
                                Text(
                                  'Network Error',
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                              if (error is BadRequestException) ...[
                                Text(
                                  message,
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ],
                          ),
                         DataStateSuccess(:final data) => ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              final item = data[i];
                              return ListTile(title: Text(item.name));
                            },
                          ),
                          _ => Container(),
                        };
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
