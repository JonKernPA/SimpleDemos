class Post
  include MongoMapper::Document

  # Attributes ::::::::::::::::::::::::::::::::::::::::::::::::::::::
  key :title, String

  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  key :category_id, ObjectId
  belongs_to :category

  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  # Callbacks :::::::::::::::::::::::::::::::::::::::::::::::::::::::
  

end