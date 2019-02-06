Queries::ProductsQueries = GraphQL::ObjectType.define do
  field :product, Types::ProductType do
    description 'Get a Product by ID'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) {
      Product.find(args[:id])
    }
  end

  connection :products, Connections::ProductsConnection do
    description 'Get all Products'

    resolve ->(_obj, args, ctx) {
      Product.all
    }
  end
end
