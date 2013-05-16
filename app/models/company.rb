class Company < ActiveRecord::Base
  attr_accessible :about, :name, :numemploy, :sector
  belongs_to: User
  has_many :relationships, foreign_key: "follower_id", dependent: destroy
  has_many :reverse_relationships, foreign_key: "followed_id"
				   class_name: "Relationship",
			 	   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true
  validates :about, presence: true
  validates :numemploy, presence: true
  validates :sector, presence: true

end
