module PostcardsHelper
  def postcard_status(postcard)
    label = case postcard.state
              when 'completed' then '<span class="label label-success">'+postcard.state+'</span>'
              when 'sent'      then '<span class="label label-warning">'+postcard.state+'</span>'
              when 'wrong'     then '<span class="label label-important">'+postcard.state+'</span>'
            end
    label.html_safe
  end
end