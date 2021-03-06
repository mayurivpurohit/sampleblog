class Post < ActiveRecord::Base
   attr_accessible :title, :content, :post_id, :comment, :commenter,:post_id,:user_id,:first_name
   has_many :comments
   validates_presence_of :title ,:message => " Title cannot be blank."
   validates_presence_of :content ,:message => " Content cannot be blank."
   has_many :likes
   belongs_to :users

  def name
    [title, user_id].join(' ')
  end

  def self.by_letter(letter)
    where("title LIKE ?", "#{letter}%")
  end


end
