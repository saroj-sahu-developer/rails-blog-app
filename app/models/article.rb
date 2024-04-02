class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end


# You may be wondering where the title and body attributes are defined. Active Record automatically defines model attributes for every table column, so you don't have to declare those attributes in your model file.
