class ContactsController < ApplicationController

  def index
    contacts = Contact.all 
    render json: contacts.as_json
  end 

  def create
    contact = Contact.new(first_name: params["input_first"], last_name: params["input_last"], email: params["input_email"], phone_number: params["input_phone"])
    contact.save
    render json: contact.as_json
  end 

  def show 
    contact_id = params["id"]
    contact = Contact.find_by(id:contact_id)
    render json: contact.as_json 
  end 

  def update
    contact_id = params["id"]
    contact = Contact.find_by(id:contact_id)
    contact.first_name = params["input_first"]
    contact.last_name = params["input_last"]
    contact.email = params["input_email"]
    contact.phone_number = params["input_phone"]
    contact.save
    render json: contact.as_json
  end 

  def destroy
    contact_id = params["id"]
    contact = contact.find_by(id:contact_id)
    contact.destroy
    render json: {message: "Your contact has been deleted"}
  end 

end 
