class ContactsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:submit, :update]

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.birthday = params[:birthday]
    @contact.unique_token = params[:unique_token]
    @contact.user_id = params[:user_id]
    @contact.date_last_updated_by_user = params[:date_last_updated_by_user]
    @contact.email_address = params[:email_address]
    @contact.zip_code = params[:zip_code]
    @contact.state = params[:state]
    @contact.city = params[:city]
    @contact.address_line_one = params[:address_line_one]
    @contact.address_line_two = params[:address_line_two]
    @contact.last_name = params[:last_name]
    @contact.first_name = params[:first_name]

    if @contact.save
      redirect_to "/contacts", :notice => "Contact created successfully."
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.birthday = params[:birthday]
    @contact.unique_token = params[:unique_token]
    @contact.user_id = params[:user_id]
    @contact.date_last_updated_by_user = params[:date_last_updated_by_user]
    @contact.email_address = params[:email_address]
    @contact.zip_code = params[:zip_code]
    @contact.state = params[:state]
    @contact.city = params[:city]
    @contact.address_line_one = params[:address_line_one]
    @contact.address_line_two = params[:address_line_two]
    @contact.last_name = params[:last_name]
    @contact.first_name = params[:first_name]

    ## HTTP://LOCALHOST:3000/SUBMIT/[**token**]

    if URI(request.referer).path.split("/").include?("submit")

      render 'show'

    else
      if @contact.save
        redirect_to "/contacts", :notice => "Contact updated successfully."
      else
        render 'edit'
      end
    end
  end

  def submit
    @contact = Contact.find_by(unique_token: params[:unique_token])
  end

  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    redirect_to "/contacts", :notice => "Contact deleted."
  end
end
