module Jekyll
  module PageNav
    def page_nav(html)
      doc = Nokogiri::HTML(html)

      h2_elements = doc.css("h2")

      nav_items = h2_elements.map do |h2|
        {
          text: h2.text,
          id: h2.attribute("id")&.value
        }
      end
      list_items = nav_items.map do |nav_item|
        if nav_item[:id]
          "<li class=\"py-1\"><a class=\"btn btn-sm btn-link link-secondary text-decoration-none fw-light rounded-0 border-0 py-0 text-start\" href=\"##{nav_item[:id]}\">#{nav_item[:text]}</a></li>"
          # "<li><a class=\"btn btn-sm btn-link link-secondary text-decoration-none fw-light border-0 ps-0 text-start\" href=\"##{nav_item[:id]}\">#{nav_item[:text]}</a></li>"
        else
          # do nothing - only include what is clickable
          # "<li class=\"text-secondary\">#{nav_item[:text]}</li>"
          ""
        end
      end

      list_items.join
    end
  end
end

Liquid::Template.register_filter(Jekyll::PageNav)
