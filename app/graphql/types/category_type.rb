Types::CategoryType = GraphQL::ObjectType.define do
  name 'Category'
  description 'A Product Category'

  field :id, !types.ID
  field :title, !types.String
  # field :products, types[Types::ProductType]

  field :products, types[Types::ProductType], resolve: ->(category, args, ctx) do
    BatchLoader::GraphQL.for(category.id).batch(default_value: []) do |category_ids, loader|
      Product.where(category_id: category_ids).each do |product|
        loader.call(product.category_id) { |memo| memo << product }
      end
    end
  end
end
