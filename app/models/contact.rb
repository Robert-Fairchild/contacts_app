class Contact < ApplicationRecord

  def full_name
    full_name = "#{first_name} #{last_name}"
  end 
  
  def as_json
    { 
      id: id,
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      created_at: created_at,
      updated_at: updated_at,

    }
  end 


end
