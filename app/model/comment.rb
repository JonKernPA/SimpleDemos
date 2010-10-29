class Comment
  include MongoMapper::Document
  key :text, String

  many :comments
  key :comment_id, ObjectId
  belongs_to :comment

  key :blog_id, ObjectId
  belongs_to :blog

  def to_s(depth = 1)
    prefix = "\t"*depth
    puts "#{prefix}#{text}"
    comments.each do |c|
      c.to_s(depth+1)
    end
  end
end
