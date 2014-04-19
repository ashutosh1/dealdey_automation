class HighlightAbstractTest
  def highlight element, driver
    orig_style = element.attribute("style")
    driver.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "border: 4px solid yellow; color: yellow;cursor:pointer;")
    sleep 1
    driver.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
  end
  def call *args
    case args.first
    when :before_click
      highlight args[1], args[2]
    end
  end
end
