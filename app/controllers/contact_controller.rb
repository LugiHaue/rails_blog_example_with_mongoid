class ContactController < ApplicationController
  before_action :active, only: [:show]
  before_action :find, only: [:review, :destroy, :status]

  layout 'dashboard_application'

	def show
    if params[:page].blank?
      @no = 0
    else
      page = params[:page].to_i
      page = 0 if page == 1
      page = page - 1 if page > 1
      @no =  page * 5
    end

    @show = params[:id]

    case @show
    when 'all'
      @contacts = Contact.order(created_at: :desc).page(params[:page])
    when 'read'
      @contacts = Contact.where(status: true).order(created_at: :desc).page(params[:page])
    when 'unread'
      @contacts = Contact.where(status: false).order(created_at: :desc).page(params[:page])
    else
      return not_found
    end

    @heading = @show.capitalize
	end


	def review
	end

	def destroy
    @contact.destroy

    redirect_to :back
	end

  def status
    @contact.status = @contact.status ? false : true
    @contact.save

    redirect_to :back
  end

  private

  def active
    @active_contact = 'active'
  end

  def find
    @contact = Contact.find(params[:id]) or return not_found
  end

end