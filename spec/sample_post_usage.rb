$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'mongo_mapper'
require 'category'
require 'blog'
require 'post'
require 'comment'

MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = 'demo'

col = Category.all()
col.each {|c| c.destroy }

mm_cat = Category.create( :title => "mongomapper")
dev_cat = Category.create( :title => "development")

dev_post = Post.create( :title => "Dev with rails and mongo is fun", 
	:category => dev_cat )
mongo_post = Post.create( :title => "MongoMapper is Cool", 
	:category => mm_cat )
mongo_post2 = Post.create( :title => "MongoMapper is Awesome",
	:category => mm_cat )

dev_blog = Blog.create( :title => "Say goodbye to slow dev cycles due to DB", 
	:category => dev_cat )
dev_blog2 = Blog.create( :title => "Say hello to new learning",
	:category => mm_cat )

col = Category.all()
col.each do |cat|
  puts "\nCATEGORY: #{cat.title}: "
  puts "   *** POSTS ***"
  cat.posts.each {|p| puts "\t#{p.title}" }
  puts "   *** BLOGS ***"
  cat.blogs.each {|b| puts "\t#{b.title}" }
end
