$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'mongo_mapper'
require 'site'
require 'user'


MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = 'demo'


site = Site.create
john = site.users.create(:name => 'John')
puts john.inspect
puts site.inspect

