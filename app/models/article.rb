class Article < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user
end
