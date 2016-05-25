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

get '/about' do	
	erb :about
end