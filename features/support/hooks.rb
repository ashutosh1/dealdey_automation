require 'data_magic'
include DataMagic

Before do 
  visit('/')
  @dealdey = DealDey.new
end

After do|scenario|
  if(scenario.failed?)
    p scenario.title
    p page.driver.browser
    p Capybara.current_driver
    time = Time.now.strftime('%b_%d_%Y_%l_%M_%S_%p')
    file_path = File.expand_path(File.join("config/screenshot/", "#{time}" + ".png"))
    page.save_screenshot file_path
    embed(File.expand_path(File.join("config/screenshot/", "#{time}" + ".png")), "image/png", "SCREENSHOT(#{time}.png)")
  end
end
