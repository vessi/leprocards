module PostcardsHelper
  def postcard_status(postcard)
    state_class = 'label label-success' if postcard.state == 'completed'
    state_class = 'label label-warning' if postcard.state == 'sent'
    state_class = 'label label-important' if postcard.state == 'wrong'

    "<span class='#{state_class}'>#{postcard.state}</span>".html_safe
  end
end