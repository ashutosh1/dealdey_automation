# require File.expand_path(File.join(File.dirname(__FILE__), 'apps/dealdey_prep/current/config', 'environment'))
require File.expand_path(File.join(File.dirname(__FILE__), 'Projects/dealday/config', 'environment'))
require 'yaml/store'
yml_file =  YAML::Store.new "#{Dir.home}/default.yml"
yml_file.transaction do 
  yml_file["home"] = {"url" => "http://vinsol:v1ns0l@dd@prep.dealdey.com"}
end

`chmod +x ~/deals_data.yml`
raw_config = File.read("#{Dir.home}/deals_data.yml")
deals_data = YAML.load(raw_config)

fashion_category_id = Category.where(can_have_pg: true).first.id
non_fashion_category_id = Category.where(can_have_pg: false).first.id
product_group_id = ProductGroup.where("status = ? AND start_date <= ? AND end_date >= ?", true, Time.zone.now.to_date, Time.zone.now.to_date).first.id

deals_type = ["shippable_deal", "non_shippable_deal", "pod_shippable_deal", "pod_non_shippable_deal", "rencreditmax_deal", "rencredit_deal"]
flash_deal_type = ["shippable_deal", "rencreditmax_deal", "rencredit_deal"]

deals_type.each do |type|
  shared_data = deals_data["shared"]
  data = deals_data[type]
  deal = Deal.new(shared_data.merge(data).merge({start_date: Date.today, end_date: Date.today+10.day, expiration_date: Date.today+15.day}))
  deal.state_ids = State.all.collect(&:id)
  deal.business_id = Business.first.id
  if flash_deal_type.include?(type)
    deal.category_id = fashion_category_id
    deal.product_group_id = product_group_id
  else
    deal.category_id = non_fashion_category_id
    File.open("./app/assets/images/no_deal_image_mobile.png") do|file|
      deal.listing_image = file
    end
  end

  File.open("./app/assets/images/no_deal_image_mobile.png") do|file|
    deal.image = file
  end

  deal.save!
  
  yml_file.transaction do
    yml_file[type] = {"url" => "/deals/#{deal.permalink}", "title" => deal.title}
  end

end