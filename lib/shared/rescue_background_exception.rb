module RescueBackgroundException

  def rescue_background_exception(&block)
    begin
      yield
    rescue Exception => e
      puts "Rescuing from background exception....#{e.message}"
    end       
  end

end