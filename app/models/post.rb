class Post < ActiveRecord::Base
   attr_accessible :title, :content, :post_id, :comment, :commenter,:post_id
   has_many :comments
   validates_presence_of :title ,:message => " Title cannot be blank."
   validates_presence_of :content ,:message => " Content cannot be blank."
   has_many :likes

   def self.search(search_title)
      if search_title
        find(:all, :conditions => ['name LIKE ?', "%#{search_title}%"])
      else
        find(:all)
     end
  end
end
