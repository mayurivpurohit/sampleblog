class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :comment, :commenter,:post,:title, :user_id
  validates_presence_of :comment ,:message => " Comment cannot be blank."
  validates_presence_of :commenter ,:message => " Commenter cannot be blank."
  # attr_accessible :title, :body
end
