# require File.expand_path(File.join(File.dirname(__FILE__), 'apps/dealdey_prep/current/config', 'environment'))
require File.expand_path(File.join(File.dirname(__FILE__), 'Projects/dealday/config', 'environment'))
merchant = Merchant.where(email: "dealdey@gmail.com").first
merchant.update_attributes(:subscription_end_date => Date.today-1.day)
