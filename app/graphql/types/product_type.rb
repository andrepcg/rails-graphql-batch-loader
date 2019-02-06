Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A Product'

  field :id, !types.ID
  field :name, !types.String
  field :price, !types.Float
  # field :category, Types::CategoryType

  field :category, Types::CategoryType, resolve: ->(product, args, ctx) do
    BatchLoader::GraphQL.for(product.category_id).batch do |category_ids, loader|
      Category.where(id: category_ids).each do |category|
        loader.call(category.id, category)
      end
    end
  end
end
