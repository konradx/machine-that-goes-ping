module ProductsHelper
  def price_format(product)
	number_to_currency(product.price, precision: 2)
  end
  
end
