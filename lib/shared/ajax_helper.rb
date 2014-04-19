module AjaxHelper
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop do
        begin
          active = page.evaluate_script('jQuery.active')
        rescue Exception => e 
          puts e.message 
        ensure
          break if active.nil? || active == 0
        end
      end
    end
  end
end