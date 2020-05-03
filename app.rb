require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

 
set :database, {adapter: "sqlite3", database: "barbershop.sqlite"}

class Client < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3 }
    validates :phone, presence: true
    validates :datestamp, presence: true
    validates :color, presence: true
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
     @c = Client.new 
  erb :visit
end 

get '/contacts' do 

  erb :contacts
end

post "/visit" do
    
    @c = Client.new params[:client]
   if  @c.save 
        erb "<h2> You write down!</h2>"
      else 
        @error = @c.errors.full_messages.first
        erb :visit
    end      
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

get '/barber/:id' do 
    @barber = Barber.find(params[:id])
    erb :barber
end   