# In Ruby on Rails, the render method is used to generate and send a response to the client. It is commonly used in controller actions to render views or to render other types of responses like JSON or plain text.

# Here are some common use cases for the render method:

# Rendering a View:
# The most common use of render is to render an HTML view associated with a specific action.

def show
  @article = Article.find(params[:id])
  render :show
end
# In this example, the show action renders the show.html.erb view associated with the show action.

################################################################
# Rendering JSON:
# You can use render to send JSON responses:
def index
  @articles = Article.all
  render json: @articles
end
# This will render a JSON representation of the @articles collection.

#######################################################################
# Rendering Plain Text:
# You can send plain text responses using render:
def plain_text_response
  render plain: 'This is a plain text response'
end

######################################################################
# Rendering XML:
# If you need to render XML responses:
def xml_response
  @article = Article.find(params[:id])
  render xml: @article
end

#########################################################################
# Rendering a Different View or Template:
# You can explicitly specify a different view or template to render:
def custom_template
  @article = Article.find(params[:id])
  render 'articles/alternate_template'
end
# In this example, it renders the alternate_template.html.erb view.

# These are just a few examples of how you can use the render method in Rails. The key is to specify the type of response you want (HTML, JSON, plain text, etc.) and any additional options such as the view template or status code.
