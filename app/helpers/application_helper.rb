module ApplicationHelper
  def markdown(text)
    options = {:filter_html => true,
               :autolink => true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text).html_safe
  end
end
