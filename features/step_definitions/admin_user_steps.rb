Given /^the admin user exists$/ do
  params = {
    "username"=> 'barcodechannel',
    "email"=> 'barcodechannel@gmail.com',
    "password"=>"password",
    "password_confirmation"=>"password"
  }
  @user = User.where(:username => 'barcodechannel').first
  if @user.nil? 
    @user = User.new(params)
    @user.save_without_session_maintenance
  end

  admin_role = Role.find_or_create_by_name('admin')
  @user.role = admin_role
  @user.save
end

Given /^I am logged in as that user$/ do
  visit path_to("the login page")
  fill_in('Username', :with => @user.username)
  fill_in('Password', :with => "password")
  click_button("Login")
end

