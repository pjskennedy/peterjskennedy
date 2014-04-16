require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'
 

class HTMLWithRouge < Redcarpet::Render::XHTML
  include Rouge::Plugins::Redcarpet

  def self.render(content)
    markdown = Redcarpet::Markdown.new(HTMLWithRouge,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
      :hard_wrap => true,
      :tables => true,
      :xhtml => true)
    markdown.render(content)
  end

end