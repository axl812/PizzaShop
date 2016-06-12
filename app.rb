require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
	# validates :title, presence: true
	# validates :description, presence: true
	# validates :price, presence: true
	# validates :size, presence: true
	# validates :is_spicy, presence: true
	# validates :is_veg, presence: true
	# validates :best_offer, presence: true
	# validates :path_to_image, presence: true
end

class Order < ActiveRecord::Base
end

# before do
# 	@products = Product.new
# end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do	
	erb :about
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
end

post '/cart' do

# получаем список параметров и парсим его
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

# сообщение, что корзина пуста
	if @items.length == 0
		return erb :cart_is_empty
	end

# список продуктов в корзине
	@items.each do |item|
		# id, cnt
		item[0] = Product.find(item[0])
	end
# представление по умолчанию
	erb :cart
end

def parse_orders_input orders_input
	
	s1 = orders_input.split(/,/)
	
	arr = []

	s1.each do |x|
		s2 = x.split('=')

		s3 = s2[0].split(/\_/)
				
		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]
		arr.push arr2

	end
	return arr
end
