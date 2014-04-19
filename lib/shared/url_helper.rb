module UrlHelper

  def url_to_visit(req_url)
    data_for("home")["url"] + data_for(req_url)["url"]
  end
  
end