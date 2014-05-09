module InlineErrorHelper

  def check_errors?(val)
    self.inline_error_messages.collect(&:text).include?(val + " can't be blank")
  end

  def check_inline_errors?(msg)
    sleep(2)
    self.inline_error_messages.collect(&:text).include?(msg)
  end
  
end