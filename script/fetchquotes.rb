include Comfy::CmsHelper
@cms_site = Comfy::Cms::Site.first
    @cms_page = @cms_site.pages.root
    quotes = @cms_page.children.find_by_slug('quotes').children
    quotes.each do |quote|
      quote_params = {
        author: cms_block_content('quote_author', quote),
        quote_text: cms_block_content('quote_text', quote),
        link: cms_block_content('quote_url', quote),
      }
      db_quote = Quote.find_or_initialize_by(author: cms_block_content('quote_author', quote))
      db_quote.update(quote_params)
    end

