module ApplicationHelper
  def full_title page_tile = ""
    base_title = t "base_title"
    if page_tile.empty?
      base_title
    else
      "#{page_tile}"
    end
  end

  def active_page active_page
    @active == active_page ? "active" : ""
  end

  def add_child_button(name, association,target)
    content_tag(:spam,"<span>#{name}</span>".html_safe,
      :class => "add_child",
      :"data-association" => association,
      :target => target)
  end

  def remove_child_button(name)
    content_tag(:div,"<span>Remove</span>".html_safe,
      :class => "remove_child")
  end

end
