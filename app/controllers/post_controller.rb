class PostController < ApplicationController
  before_action :active, only: [:show, :new, :edit]
  before_action :categories, only: [:new, :edit]
  before_action :find, only: [:edit, :destroy, :update, :status]

  layout 'dashboard_application'

	def show
    if params[:page].blank?
      @no = 0      
    else
      page = params[:page].to_i
      page = 0 if page == 1
      page = page - 1 if page > 1
      @no  = page * 5
    end

    @show = params[:id]

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

    @heading =  @show.capitalize
	end

	def create
      data = params.permit(:title , :is_active)
      data['tags'] = params[:tags].split(',').map{ |e| e.downcase}

      unless params[:image].blank? || params[:image] == 'on'
        image = Image.create(params.permit(:image))
      end

      @post = Post.new(data)
      @post.category_id = params[:category_id]

      unless image.blank? 
        @post.image_id = image.id
      end

      if @post.save
        content = Content.new
        content.body = params[:body]
        content.post_id = @post.id
        content.save

        redirect_to post_url(:all)
      else
        active
        categories
        render 'new'
      end
	end

	def new
	end

	def edit
	end

	def destroy
    @post.content.destroy

    if @post.image
        @post.image.destroy
    end
    
    @post.destroy
    redirect_to :back
	end

	def update
      content = Content.find(params[:content_id])
      content.body = params[:content]
      content.save

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

      redirect_to :back
	end


  def status
    @post.is_active = @post.is_active ? false : true
    @post.save
    redirect_to :back
  end

  private
    def active
      @active_post = 'active'
    end

    def categories
      @categories = Category.order(created_at: :desc).all
    end

    def find
      @post = Post.find(params[:id])
    end
end