$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'mongo_mapper'
require 'company'
require 'job'
require 'pp'

cnx = MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017)
MongoMapper.database = 'demo'

db = cnx.db("demo")

unless db.nil?
  db.collection_names.each do |name|
    coll = db.collection(name)
    puts "\t #{name} (#{coll.count()})"
  end
end

# Clean any data from prior runs
coll = db.collection("companies")
coll.drop unless coll.nil?

coll = db.collection("jobs")
coll.drop unless coll.nil?

# Create some samples to show nesting
puts "\nCreating company:"
c1 = Company.create(:name => "Greatest Company Ever" )
puts "\tCompany: " + c1.to_json

puts "\nCreating job 1:"
# j1 = Job.create( :description => "Agile Quarterback", :company => c1)
j1 = Job.create( :description => "Agile Quarterback")
c1.jobs << j1
puts "\tJob 1: " + j1.to_json

puts "\nCreating job 2:"
j2 = Job.create(:description => "MongoMapper Guru", :company => c1)
puts "\tJob 2: " + j2.to_json

puts "\n\nCompany: " + c1.to_json 
c1.jobs.each_with_index {|j,i| puts "   #{i+1}: #{j.to_json}"}

puts '*'*50
puts c1.to_s_full

puts '*'*50

puts "\n\nCompany: " + c1.to_json 
c1.jobs.each_with_index {|j,i| puts "   #{i+1}: #{j.to_json}"}

job_to_delete = c1.jobs[0]
puts "\nNow lets delete the first job: '#{job_to_delete.description}'"
c1.remove_job(job_to_delete)
j1.destroy
c1.save!
c1 = Company.find_by_name("Greatest Company Ever")

puts "\n\nAfter Delete: " + c1.to_json 
c1.jobs.each_with_index {|j,i| puts "   #{i+1}: #{j.to_json}"}

