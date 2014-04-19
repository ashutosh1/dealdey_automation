module FormHelper

  def populate_form(data={})
    data.keys.each do|key|
      instance_eval(key).set data[key] if self.send("has_#{key}?")
    end
  end

end