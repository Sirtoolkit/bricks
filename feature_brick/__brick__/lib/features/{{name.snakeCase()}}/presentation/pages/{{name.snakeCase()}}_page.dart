import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:{{project_name}}/core/error/app_exception.dart';

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
                    child: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
                      builder: (_, state) {
                        return switch (state) {
                          {{name.pascalCase()}}StateLoading() => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          {{name.pascalCase()}}StateError() => Column(
                            children: [
                              if (state.exception is NetworkException) ...[
                                Text(
                                  'Network Error',
                                  style: textTheme.bodyMedium,
                                ),
                              ],

                              if (state.exception is ServerException) ...[
                                Text(
                                  state.message,
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ],
                          ),
                          {{name.pascalCase()}}StateLoaded() => ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
