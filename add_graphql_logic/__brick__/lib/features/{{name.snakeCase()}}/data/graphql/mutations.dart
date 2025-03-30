class {{name.camelCase()}}Mutations {
  // GraphQL mutation to create a new item
  static const String create = r'''
    mutation Create{{name.pascalCase()}}($input: {{name.pascalCase()}}Input!) {
      create{{name.pascalCase()}}(input: $input) {
        id
        name
        # Add other fields as needed
      }
    }
  ''';

  // GraphQL mutation to update an item
  static const String update = r'''
    mutation Update{{name.pascalCase()}}($id: Int!, $input: {{name.pascalCase()}}Input!) {
      update{{name.pascalCase()}}(id: $id, input: $input) {
        id
        name
        # Add other fields as needed
      }
    }
  ''';

  // GraphQL mutation to delete an item
  static const String delete = r'''
    mutation Delete{{name.pascalCase()}}($id: Int!) {
      delete{{name.pascalCase()}}(id: $id)
    }
  ''';
}