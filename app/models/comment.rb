class Comment < ActiveRecord::Base
  attr_accessible :article, :body, :commenter
  belongs_to :article
end
