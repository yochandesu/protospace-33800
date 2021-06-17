class Comment < ApplicationRecord

  belongs_to :user
  has_many :prototypes

validates :comment, presence: true

end
