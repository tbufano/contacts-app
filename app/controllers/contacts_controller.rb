class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render = "index.html.erb"
  end

  def new
    render = "new.html.erb"
  end

  def create
    Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address]
    )
    render = "create.html.erb"
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render = "show.html.erb"
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render = "edit.html.erb"
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address]
    )
    render = "update.html.erb"
  end

  def destroy
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.destroy
    render "destroy.html.erb"
  end
end
