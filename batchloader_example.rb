def load_products(ids)
  Product.where(id: ids)
end

def load_category(product)
  BatchLoader.for(product.category_id).batch do |category_ids, loader|
    Category.where(id: category_ids).each { |category| loader.call(category.id, category) }
  end
end

products = load_products([1, 2, 3])
# Product Load  SELECT products.* FROM products WHERE products.id IN (1, 2, 3)

categories = products.map do |product|
  load_category(product) # no query is initiated here
end

# categories = [#<BatchLoader:0x140529968442360>, #<BatchLoader:0x140529968430680>, #<BatchLoader:0x140529968425600>]

first_cat_id = categories.first.id
# Category Load  SELECT categories.* FROM categories WHERE categories.id IN (4, 5, 1)
