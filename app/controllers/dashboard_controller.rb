class DashboardController < ApplicationController

  layout 'dashboard_application'

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
  
end
