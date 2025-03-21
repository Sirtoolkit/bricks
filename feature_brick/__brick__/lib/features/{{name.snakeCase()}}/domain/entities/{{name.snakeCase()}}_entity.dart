class {{name.pascalCase()}}Entity {
  final String id;
  final String name;
  // Add other properties as needed
  
  const {{name.pascalCase()}}Entity({
    required this.id,
    required this.name,
    // Add other required properties
  });
}