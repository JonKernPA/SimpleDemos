$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'mongo_mapper'
require 'person'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = 'demo'

p = Person.create(:first_name => "Jon", :last_name => "Kern", :age => 9)
if p.save
  puts "#{p.first_name} #{p.last_name} (age #{p.age})"
else
  puts "Error(s): "
  p.errors.each {|k,v| puts "#{k}: #{v}"} 
end

# Person.destroy_all
