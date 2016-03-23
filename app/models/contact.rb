class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :grouped_contacts
  has_many :groups, through: :grouped_contacts
  
  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def full_name
    if middle_name.nil?
      first_name + " " + last_name
    else
      first_name + " " + middle_name + " " + last_name
    end
  end

  def japan_phone
    "+81 #{phone_number}"
  end
end
