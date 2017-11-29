require "unirest"
require "pp"

while true
  system "clear"
  base_url = "http://localhost:3000/v1"

  puts "Choose an option:"
  puts "[1] Show all contacts"
  puts "[1.1] Search contact by category"
  puts "[2] Create a contact"
  puts "[3] Show a contact"
  puts "[4] Update a contact"
  puts "[5] Destroy a contact"
  puts "[6] Create Account"
  puts "[7] Login"
  puts "[8] Logout"
  puts "[q] Quit App"

  input_option = gets.chomp
  if input_option == "1"
    response = Unirest.get("#{base_url}/contacts")
    contacts = response.body
    pp contacts
elsif input_option == "1.1"
  puts "Search by category:"
  puts "[1] first_name"
  puts "[2] middle_name"
  puts "[3] last_name"
  puts "[4] email"
  puts "[5] phone_number"
  puts "[6] bio"
  input_sub_option = gets.chomp
  if input_sub_option == 1
    params = {}
    print "Enter first_name"
    params[:first_name] = gets.chomp
  elsif input_sub_option == 2
    print "Enter middle_name"
    params[:middle_name] = gets.chomp
  elsif input_sub_option == 3
    print "Enter last_name"
    params[:last_name] = gets.chomp
  elsif input_sub_option == 4
    print "Enter email"
    params[:email] = gets.chomp
  end
  # start editing here!!!


elsif input_option == "2"
  params = {}
  print "New contact first name: "
  params[:first_name] = gets.chomp
  print "New contact middle name: "
  params[:middle_name] = gets.chomp
  print "New contact last name: "
  params[:last_name] = gets.chomp
  print "New contact email: "
  params[:email] = gets.chomp
  print "New contact phone number: "
  params[:phone_number] = gets.chomp
  print "New contact bio: "
  params[:bio] = gets.chomp
  response = Unirest.post("#{base_url}/contacts", parameters: params)
  contact = response.body
  pp contact
elsif input_option == "3"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("#{base_url}/contacts/#{contact_id}")
  contact = response.body
  pp contact
elsif input_option == "4"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("#{base_url}/contacts/#{contact_id}")
  contact = response.body
  params = {}
  print "Updated first name (#{contact["first_name"]}): "
  params[:first_name] = gets.chomp
  print "Updated middle name (#{contact["middle_name"]}): "
  params[:middle_name] = gets.chomp
  print "Updated last name (#{contact["last_name"]}): "
  params[:last_name] = gets.chomp
  print "Updated email (#{contact["email"]}): "
  params[:email] = gets.chomp
  print "Updated phone number (#{contact["phone_number"]}): "
  params[:phone_number] = gets.chomp
  print "Updated bio (#{contact["bio"]}): "
  params[:bio] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("#{base_url}/contacts/#{contact_id}", parameters: params)
  contact = response.body
  pp contact
elsif input_option == "5"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.delete("#{base_url}/contacts/#{contact_id}")
  pp response.body
elsif input_option == "6"
  print "Enter name: "
  input_name = gets.chomp
  print "Enter email: "
  input_email = gets.chomp
  print "Enter password: "
  input_password = gets.chomp
  print "Confirm password: "
  input_password_confirmation = gets.chomp
  response = Unirest.post(
      "#{base_url}/users",
      parameters: {
        name: input_name,
        email: input_email,
        password: input_password,
        password_confirmation: input_password_confirmation
      }
    )
  pp response.body
  elsif input_option == "7"
    print "Enter email: "
    input_email = gets.chomp
    print "Enter password: "
    input_password = gets.chomp

    response = Unirest.post(
      "http://localhost:3000/user_token",
      parameters: {
        auth: {
          email: input_email,
          password: input_password
        }
      }
    )
    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    pp response.body
  elsif input_option == "8"
    jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out successfully!"
 elsif input_option == "q"
   puts "Goodbye!"
   break
  end
  puts "Press enter to continue"
  gets.chomp
end
   

