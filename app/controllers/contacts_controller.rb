class ContactsController < ApplicationController
  def index
    # @contacts = Contact.all
    if current_user
      @contacts = current_user.contacts
      if params[:group]
        @contacts = Group.find_by(name: params[:group])
                         .contacts
                         .where(user_id: current_user.id)
      end
    else
      redirect_to "/users/sign_in"
    end
  end

  def new
  end

  def create
    address = params[:address]
    if address.nil?
      address = "2413 S Western Ave, Chicago, IL, 60608"
    end
    Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address],
      user_id: current_user.id
    )
    render = "create.html.erb"
  end

  def show
    if current_user
      contact_id = params[:id]
      @contact = Contact.find_by(id: contact_id)
    else
      redirect_to "/users/sign_in"
    end
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
