class CategoryController < ApplicationController
  before_action :active, except: [:destroy, :status]
  before_action :find, except: [:index, :create, :new]
  layout 'dashboard_application'

	def index
    @categories = Category.order(order: :asc).all
	end

	def create
    @category = Category.create(category_params)

    if(@category.valid?)
      redirect_to category_index_url
    else
      render 'new'
    end
	end

	def new
	end

	def edit
	end

	def destroy
    @category.destroy
    redirect_to :back, notice: 'Category was successfully destroyed.'
	end

	def update
    @category.update(category_params)

    unless @category.status
      postDisableById(@category.id)
    end

    if @category.valid?
      redirect_to category_index_url, notice: 'Category was successfully updated.'
    else
      render 'edit'
    end
	end

  def status
    @category.status = @category.status ? false : true

    unless @category.status
      postDisableById(@category.id)
    end

    @category.save
    redirect_to :back, notice: 'Category status was successfully changed.'
  end

  private

  def active
    @active_categories = 'active'
  end

  def find
    @category = Category.find(params[:id])
  end

  def postDisableById category_id
    post = Post.where(category_id: category_id).all
    post.update_all({is_active: false})
  end

  def category_params
    data = params.permit(:name , :order)
    data['status'] = params[:status] == 'true' ? true : false
    data
  end

end