#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :size, presence: true
	validates :is_spicy, presence: true
	validates :is_veg, presence: true
	validates :best_offer, presence: true
	validates :path_to_image, presence: true
end

before do
end

get '/' do
	@product = Product.all
	erb :index
end

post '/' do
	erb :cart
end

get '/about' do	
	erb :about
end

post '/cart' do
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		# id, cnt
		item[0] = Product.find(item[0])
	end
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