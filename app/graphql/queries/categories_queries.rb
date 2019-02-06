Queries::CategoriesQueries = GraphQL::ObjectType.define do
  field :category, Types::CategoryType do
    description 'Get a category by ID'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) {
      Category.find(args[:id])
    }
  end

  connection :categories, Connections::CategoriesConnection do
    description 'Get all Categories'

    resolve ->(_obj, args, ctx) {
      Category.all
    }
  end
end
