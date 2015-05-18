class HomeController < ApplicationController

  before_action :recent_post , :getCategories

  layout 'home_application'

  def index

  	@active_index = 'active'

    @title = 'GreenFish'

    @posts = Post.where(is_active: true).order(created_at: :desc).page(params[:page])
 
  end

  def about

  	@active_about = 'active'

    @title = 'GreenFish | About'
  	
    @about = AboutPage.first

  end

  def contact

    if request.post?

      data = params.permit(:name , :email , :subject , :message)

      @contactResult = Contact.create(data)

    end
    
    @active_contact = 'active'

    @title = 'GreenFish | Contact'

    @contact = ContactPage.first

  end

  def show

    if params[:category]

      category = Category.where(name: params[:category]).where(status: true).first
      
      @posts = Post.where(category_id: category.id).where(is_active: true).order(created_at: :desc).page(params[:page]);

      @title = 'GreenFish | Category - ' + category.name
   
    elsif params['tag']
      
      @posts = Post.where(tags: {'$in': [params['tag']] }).order(created_at: :desc).page(params[:page]);

      @title = 'GreenFish | Tag - ' + params['tag']

    else

      raise 'Hatalı parametre'

    end

    render template: "home/index"
    
  end

  def post

    @post = Post.where(is_active: true).find(params[:id])

    @title = @post.title


  end

  private

  def recent_post
      @recent_post = Post.where(is_active: true).order(created_at: :desc ).limit(7)
  end

  def getCategories
      @categories = Category.where(status: true).order(order: :asc).all
  end

end
