class ContactPageController < ApplicationController
  before_action :active, only: [:edit, :update]
  before_action :find, only: [:edit, :update]

  layout 'dashboard_application'

  def edit
  end

  def update
    data = params.permit(:title , :content)
    @contact.update(data)

    render 'edit'  
  end

  private

  def active
    @active_contactPage = 'active'
  end

  def find
    @contact = ContactPage.first    
  end

end