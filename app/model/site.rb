class Site
  include MongoMapper::Document
  
  key :user_ids, Array
  many :users, :in => :user_ids
end
