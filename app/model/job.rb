class Job
   include MongoMapper::Document

   key :description, String
   
   # one :company # This does NOT work
   key :company_id, ObjectId
   belongs_to :company
   
   def to_s
     "#{company}: #{description}"
   end
end

