# Be sure to have mongod running
# Below is an attempt to show one way to have nested comments on a blog post
# I did not thoroughly examine whether it is bulletproof or performant. But it seemed to work :-)

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'mongo_mapper'
require 'blog'
require 'comment'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = 'demo'

# Clean any data from prior runs
col = Blog.all()
col.each {|c| c.destroy }
col = Comment.all()
col.each {|c| c.destroy }

# Create some samples to show nesting
blog = Blog.create(:title => "Greatest Idea Ever" )
c1 = Comment.create( :text => "Comment 1", :blog => blog)
c2 = Comment.create(:text => "Comment 2", :blog => blog)

c11 = Comment.create(:text => "Comment 1 - 1", :blog => blog, :comment => c1)
c12 = Comment.create(:text => "Comment 1 - 2", :blog => blog, :comment => c11)
blog.to_s
