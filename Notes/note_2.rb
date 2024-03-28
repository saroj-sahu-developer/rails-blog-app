def create
  form_data = params[:article]
  render json:params
  @article = Article.new
  @article.title = form_data[:title]
  @article.body = form_data[:body]

  if @article.save
    redirect_to @article
  else
    render :new, status: :unprocessable_entity
  end
end

# This method is used to save form_data to database.
# params is a rails method to fetch all the requests.
# example:- params will return,
# {
#   "authenticity_token": "IhhT3gzeem3sMf7-GOGdmtHR4AjIx9KOH1-cKibuTZr002ujoYbI_FjR8LYVTsmWUg2c_VDE46Wj-p0X0zehPA",
#   "article": {
#       "title": "Hi",
#       "body": "Hello"
#   },
#   "commit": "Create Article",
#   "controller": "articles",
#   "action": "create"
# }
#
#From here we fetched params[:article](as ruby treats this payload as a Hash).


# Method-2
def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render :new, status: :unprocessable_entity
  end
end

private
def article_params
  params.require(:article).permit(:title, :body)
end

# params.require(:article).permit(:title, :body) is a security measure in Ruby on Rails, known as "strong parameters." This mechanism helps protect your application from mass assignment vulnerabilities.

# Mass assignment occurs when a user submits a form or request with more parameters than expected. Without proper protection, these additional parameters could potentially be used to update or modify attributes on a model that were not intended to be user-editable.

# params.require(:article): This ensures that the params hash must contain a key called :article. If it's not present, an error will be raised.

# .permit(:title, :body): This specifies which parameters are allowed for mass assignment. In this case, only :title and :body are permitted. Other parameters in the params[:article] hash will be ignored.
