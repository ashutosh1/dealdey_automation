require File.expand_path(File.join(File.dirname(__FILE__), 'apps/dealdey_staging/current/config', 'environment'))
# require File.expand_path(File.join(File.dirname(__FILE__), 'Projects/dealday/config', 'environment'))
["vijay12@mailinator.com", "vijay123@mailinator.com", "vijay@vinsol.com", "vij102@mailinator.com", "vijay1@mailinator.com"].each do |mail|
  unless User.unscoped.where(email: mail).exists?
    user = User.create!(email: mail, firstname: "Vijay", lastname: "Autotest", password: 123456, age_bracket: "18-25", gender: "Male", mobile: "08919191911")
    user.confirm!
    user.update_attribute(mobile_verified: true)
  end
end

#Creating one credit payment option
users = User.where(email: ["vijay@vinsol.com", "vij102@mailinator.com"])
users.each do |user|
  OneCredit.create!(:name => user.name, :paylater_id => 123, :email => user.email, :amount => 10000)
end

#Reducing wallet amount to test multiple payment option(one credit and wallet)
users = User.where(email: ["vij102@mailinator.com", "vijay12@mailinator.com", "vijay123@mailinator.com"])
users.each{|user| user.update_attribute(:balance, 100)}

#Reducing wallet amount to test multiple payment option(Visa and wallet)
user = User.where(email: "vijay1@mailinator.com").first
user.update_attribute(:balance, 1)
