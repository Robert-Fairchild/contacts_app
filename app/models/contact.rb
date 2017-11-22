class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  def full_name
    full_name = "#{first_name} #{middle_name} #{last_name}"
  end 

  def japan_phone_number
    "+81 #{phone_number}"
  end

  
  def as_json
    { 
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      japan_phone_number: japan_phone_number,
      bio: bio,
      created_at: created_at,
      updated_at: updated_at,

    }
  end 


end
