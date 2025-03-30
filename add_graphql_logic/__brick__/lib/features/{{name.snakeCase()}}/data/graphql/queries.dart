class {{name.camelCase()}}Queries {
  // GraphQL query to get all items
  static const String findAll = r'''
    query GetAll{{name.pascalCase()}} {
      {{name.camelCase()}}s {
        id
        name
        # Add other fields as needed
      }
    }
  ''';

  // GraphQL query to get item by id
  static const String findById = r'''
    query Get{{name.pascalCase()}}($id: Int!) {
      {{name.camelCase()}}(id: $id) {
        id
        name
        # Add other fields as needed
      }
    }
  ''';
}