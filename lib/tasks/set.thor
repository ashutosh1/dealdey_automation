class Set < Thor
  include Thor::Actions

  desc "browser", "sets the proper browser/platform config into cucumber's env.rb for sauce labs"
  method_option :values, :type => :hash
  def browser
    gsub_file("features/support/env.rb", /test_browser = (.*)/,"test_browser = '#{options[:values]["browser"]}'")
  end
end