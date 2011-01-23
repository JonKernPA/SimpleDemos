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
   
   def remove_job(job)
     puts "Removing job: #{job.description}"
     Job.find(job.id).destroy
     # jobs.delete(job.id)
     # j = Job.find(job.id)
     # puts "deleted job = #{j.inspect}"
     # # job.destroy # Does not do anything
     # Job.delete(job.id) # Does not do anything
     # j = Job.find(job.id)
     # puts "deleted job = #{j.inspect}"
     # Job.destroy(job.id)
     save!
   end
end

