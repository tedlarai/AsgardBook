module ApplicationHelper
  def full_title(page_title = '')
    title = 'ABook'
    unless page_title.empty?
      title = page_title + ' | ' + title
    end
    title
  end
end
