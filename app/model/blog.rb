class Blog
  include MongoMapper::Document

  # Attributes ::::::::::::::::::::::::::::::::::::::::::::::::::::::
  key :title, String
  key :category_id, ObjectId
  key :archive_after, Time

  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  belongs_to :category
  many :comments


  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  # Callbacks :::::::::::::::::::::::::::::::::::::::::::::::::::::
  before_save :set_archive
  after_save :log_save

  def to_s
    puts "\n----------\n#{title}"
    comments.each do |c|
      c.to_s if c.comment_id.nil?
    end
  end

private
  def log_save
    puts "Blog created, will be archived on #{archive_after.strftime("%d %b %Y") unless archive_after.nil?}"
  end
  def set_archive
    puts "set archive"
    self.archive_after = Time.now + 30.days
  end
end
