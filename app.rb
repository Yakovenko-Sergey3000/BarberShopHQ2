require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

 
set :database, {adapter: "sqlite3", database: "barbershop.sqlite"}

class Client < ActiveRecord::Base
  
end


class Barber < ActiveRecord::Base
end  

get '/' do 
  @barbers = Barber.order "created_at DESC"
   erb :index
 end  
