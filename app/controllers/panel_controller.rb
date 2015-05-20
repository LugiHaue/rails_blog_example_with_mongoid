class PanelController < ApplicationController

  layout 'panel_application'

  def index

    @active_index = 'active'

    @total_post_count     = Post.all.count

    @total_contact_count  = Contact.all.count
    
    @total_category_count = Category.all.count

  end

  def login

    render layout: false
    
  end

  def logout

    render layout: false

  end

  def post

    @active_post = 'active'

    unless params[:page].blank?
      
      page = params[:page].to_i

      page = 0 if page == 1

      page = page - 1 if page > 1

      @no =  page * 5
 
    else

      @no = 0

    end

    @show = params[:show]

    case @show

    when 'all'
      
      @posts = Post.order(created_at: :desc).page(params[:page])

    when 'active'

      @posts = Post.where(is_active: true).order(created_at: :desc).page(params[:page])
    
    when 'passive'

      @posts = Post.where(is_active: false).order(created_at: :desc).page(params[:page])

    else
      
      raise 'Invalid Param: show' 

    end

    @heading = @show.capitalize
    
  end

  def postEdit

    if request.post?

      content = Content.find(params[:content_id])

      content.body = params[:content]

      content.save

      @post = Post.find(params[:id])

      data = params.permit(:title , :category_id , :is_active)

      data['tags'] = params[:tags].split(',')

        unless params[:image].blank? || params[:image] == 'on'

          image = Image.create(params.permit(:image))

          data['image_id'] = image.id

        end

        if params[:image] == 'on'
          
          @post.unset('image_id')

        end

      @post.update(data)

    else

      @post = Post.find(params[:format])

    end

    @categories = Category.order(created_at: :desc).all
    
    @active_post = 'active'

  end

  def postNew

    if request.post?

      data = params.permit(:title , :is_active)

      data['tags'] = params[:tags].split(',').map{ |e| e.downcase}

      unless params[:image].blank? || params[:image] == 'on'

        image = Image.create(params.permit(:image))
      
      end

      post = Post.new(data)

      post.category_id = Category.find(params[:category_id]).id

      unless image.blank? 

        post.image_id = image.id
        
      end

      post.save

      content = Content.new

      content.body = params[:body]

      content.post_id = post.id

      content.save

      redirect_to :controller => 'panel', :action => 'post', :show => 'all'

    end

    @categories = Category.order(created_at: :desc).all

    @active_post = 'active'

  end

  def postStatus
  
    post = Post.find(params[:format])

    post.is_active = post.is_active ? false : true

    post.save

    redirect_to :back

  end

  def postDelete

    post = Post.find(params[:format])

    post.content.destroy

    if post.image

        post.image.destroy

    end

    post.destroy

    redirect_to :back

  end

  def contact
    
    @active_contact = 'active'

    unless params[:page].blank?
      
      page = params[:page].to_i

      page = 0 if page == 1

      page = page - 1 if page > 1

      @no =  page * 5
 
    else

      @no = 0

    end


    @show = params[:show]

    case @show

    when 'all'
      
      @contacts = Contact.order(created_at: :desc).page(params[:page])

    when 'read'

      @contacts = Contact.where(status: true).order(created_at: :desc).page(params[:page])
    
    when 'unread'

      @contacts = Contact.where(status: false).order(created_at: :desc).page(params[:page])

    else
      
      raise 'Invalid Param: show'

    end

    @heading = @show.capitalize

  end

  def contactStatus
    
      contact = Contact.find(params[:format])

      contact.status = contact.status ? false : true

      contact.save

      redirect_to :back

  end

  def contactReview
    
      @contact = Contact.find(params[:format])

  end

  def contactDelete
    
      contact = Contact.find(params[:format])

      contact.destroy

      redirect_to :back

  end

  def aboutPage

    @about = AboutPage.first

    if request.post?
  
      data = params.permit(:title , :content)

      @about.update(data)

    end
    
    @active_aboutPage = 'active'

  end

  def contactPage

    @contact = ContactPage.first

    if request.post?
  
      data = params.permit(:title , :content)

      @contact.update(data)

    end

    @active_contactPage = 'active'

  end

  def categoryNew

    if request.post?

      data = params.permit(:name , :order)

      data['status'] = params[:status] == 'true' ? true : false

      Category.create(data)

    end

    @active_categories = 'active'

  end

  def categoryEdit

    if request.post?

      data = params.permit(:name , :order)
        
      data['status'] = params[:status] == 'true' ? true : false

      category = Category.find(params[:id])

      category.update(data)

      unless category.status

        post = Post.where(category_id: category.id).all
        
        post.update({is_active: :false})

      end

      if category.valid?
  
        redirect_to pCategories_url

      end

      @category = category

    else

      @category = Category.find(params[:format])
    
    end

    @active_categories = 'active'

  end

  def categoryDelete

      category = Category.find(params[:format])

      category.destroy

      redirect_to pCategories_url
  end

  def categoryStatus
    
      category = Category.find(params[:format])

      category.status = category.status ? false : true

      unless category.status

        post = Post.where(category_id: category.id).all
        
        post.update_all({is_active: false})

      end

      category.save

      redirect_to pCategories_url

  end

  def categories
    
    @categories = Category.order(order: :asc).all

    @active_categories = 'active'

  end

end
