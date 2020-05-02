require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

 
set :database, {adapter: "sqlite3", database: "barbershop.sqlite"}

class Client < ActiveRecord::Base
  
end

get '/' do 
   erb "Hello"
 end  
