Types::QueryType = GraphQL::ObjectType.new.tap do |root|
  root.name = 'Query'
  root.description = 'The query root of this schema'
  root.interfaces = []

  root.fields = FieldCombiner.combine(
    [
      Queries::CategoriesQueries,
      Queries::ProductsQueries,
    ]
  )
end
