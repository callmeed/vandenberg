# app.rb
require 'rubygems'
require 'sinatra'
require 'data_mapper'

# A Sqlite3 connection to a persistent database
DataMapper::Logger.new($stdout, :debug)
DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/vandenberg.db")

class Visit
  include DataMapper::Resource
  property :id,         Serial    
  property :url_path,   String, length: 255
  property :ip,         String, length: 255
  property :user_agent, Text
  property :created_at, DateTime  
end

class Submission
  include DataMapper::Resource
  property :id,         Serial
  property :page,       String, length: 255
  property :name,       String, length: 255
  property :email,      String, length: 255
  property :phone,      String, length: 255
  property :

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @visit = Visit.create(url_path: request.path, ip: request.ip, user_agent: "Foo", created_at: Time.now)
  @visits = Visit.all(order: [ :id.desc ])
  erb :index
end

post '/submit' do 

end