class Job
   include MongoMapper::Document

   key :description, String
   
   # one :company # This does NOT work
   key :company_id, ObjectId
   belongs_to :company
   
   def to_s
     "#{company.nil? ? 'n/a' : company}: #{description}"
   end
   
   def self.show_all
     puts "\nALL JOBS:"
     jobs = Job.all
     jobs.each {|job| puts "\t#{job}"}
   end
end

