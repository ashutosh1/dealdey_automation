require 'rubygems'
require 'rspec/expectations'
require "selenium-webdriver"
require 'require_all'
require 'capybara/cucumber'
require 'site_prism'
require 'data_magic'
include DataMagic

require_all './lib/shared/*.rb'
require_all './lib/pages/*/*.rb'

World(AjaxHelper, RescueBackgroundException, UrlHelper)

test_browser = 'chrome'
obj_higlight = HighlightAbstractTest.new
  
Capybara.register_driver test_browser.to_sym do |app|
  Capybara::Selenium::Driver.new(app, :browser => test_browser.to_sym, :listener => obj_higlight)
end
Capybara.default_driver = test_browser.to_sym

Capybara.app_host = data_for("home")["url"]
Capybara.default_wait_time = 10

class String
  def underscore
    word = self.dup
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end
end