class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :comment, :commenter,:post,:title
  validates_presence_of :comment ,:message => " Comment cannot be blank."
end
