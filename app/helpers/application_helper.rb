module ApplicationHelper

  # returns a full title on a page by page basis
  def full_title short_title
    base_title = "Ruby on Rails Tutorial Sample App"
    if short_title.empty?
      base_title
    else
      "#{base_title} | #{short_title}"
    end
  end


end
