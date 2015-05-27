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
  
end
