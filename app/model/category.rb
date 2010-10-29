class Category
  include MongoMapper::Document

  # Attributes ::::::::::::::::::::::::::::::::::::::::::::::::::::::
  key :title, String

  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  many :posts
  many :blogs

  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  # Callbacks :::::::::::::::::::::::::::::::::::::::::::::::::::::::

end