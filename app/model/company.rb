class Company
   include MongoMapper::Document
   
   key :name, String
   
   many :jobs
   
   def to_s
     name
   end
   
   def to_s_full
     text = "\n#{name}"
     unless jobs.empty?
       text += "\n    JOB LISTING\n"
       jobs.each {|j| text += "    #{j.description}\n"}
       text += "\n"
     end
     text
   end
   
   def to_jobs
     jobs.each_with_index {|j,i| puts "   #{i+1}: #{j.description}"}
   end
   
   def to_jobs_json
     jobs.each_with_index {|j,i| puts "   #{i+1}: #{j.to_json}"}
   end
   
   def remove_job(job)
     puts "Removing job: #{job.description}"
     jobs.delete(job.id)
     job.company = nil
     save!
   end

   def self.show_all
     puts "\nALL COMPANIES:"
     companies = Company.all
     companies.each {|company| puts "\t#{company}"}
   end
end

