require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

 
set :database, {adapter: "sqlite3", database: "barbershop.sqlite"}

class Client < ActiveRecord::Base
  
end


class Barber < ActiveRecord::Base
end  

before do 
 @barbers = Barber.order "created_at DESC"
end  
get '/' do 
  
   erb :index
 end  

get '/visit' do 

  erb :visit
end 

get '/contacts' do 
  erb :contacts
end

post "/visit" do
  @user_name = params[:username]
  @phone = params[:phone]
  @data_stamp = params[:datetime]
  @name_master = params[:name]
  @color = params[:color]
    
      erb :visit
        
end