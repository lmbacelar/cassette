module ApplicationHelper
  def icon_tag icon, text
    text ||= ''
    icon ? raw("<i class='#{icon}'> #{text}</i>") : text
  end

  def sortable column, title=nil, options={}
    column = column.to_s
    if column == sort_column && sort_direction == 'asc'
      direction = 'desc'
      icon = 'icon-arrow-down'
    elsif column == sort_column && sort_direction == 'desc'
      direction = 'asc'
      icon = 'icon-arrow-up'
    end
    link_to icon_tag(icon, title || column.titleize), params.merge(sort: column, direction: direction, page: nil)
  end
end
