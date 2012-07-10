module ApplicationHelper
  def logo
    image_tag("logo.gif", :alt => "Sample App", :class => "round")
  end
end
