class Person
  include MongoMapper::Document
  
  key :first_name, String
  key :last_name, String
  key :age, Integer
  key :born_at, Time
  key :active, Boolean
  key :fav_colors, Array

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_numericality_of :age

  validate :custom_validation

  def custom_validation
    if age < 20
      errors.add( :age, "Youth is wasted on the young")
    end
  end

end

