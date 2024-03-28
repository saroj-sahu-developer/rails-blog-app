class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  # validates :title, presence: true
  # validates :body, presence: true, length: { minimum: 10 }

  before_save :method_1
  after_save  :method_2, :method_3, :method_4

  def method_1
    puts "method-1 was invoked"
  end

  def method_2
    puts "method-2 was invoked"
    @article = Article.find("20")
    @comment = @article.comments.find("6")
    @comment.commenter = "Saroj kumar"
    @comment.save
  end

  def method_3
    puts "method-3 was invoked"
    throw :abort
  end

  def method_4
    puts "method-4 was invoked"
  end


end


# You may be wondering where the title and body attributes are defined. Active Record automatically defines model attributes for every table column, so you don't have to declare those attributes in your model file.
