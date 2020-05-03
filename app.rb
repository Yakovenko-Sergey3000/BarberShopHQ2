require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

 
set :database, {adapter: "sqlite3", database: "barbershop.sqlite"}

class Client < ActiveRecord::Base
  
end


class Barber < ActiveRecord::Base
end  

class Contact < ActiveRecord::Base
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
  @barber = params[:name]
  @color = params[:color]

    Client.create :name => @user_name,:phone => @phone,:datestamp => @data_stamp,:barer => @barber,:color => @color 
      
      
      erb "<h2> You write down!</h2>"
        
end

get '/contacts' do 
    erb :contacts
 end  

post '/contacts' do 
  @username = params[:username]
  @text = params[:text]
  Contact.create :name => @username, :text => @text
    erb "Messege goin"
  
end 