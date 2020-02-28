module ApplicationHelper

  def title 
    if content_for?(:title)
      content_for :title
    else
      "#{controller_name.capitalize } | Lewis M Sparlin"
    end
  end

end
