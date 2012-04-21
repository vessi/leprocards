class Postcard < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def state
    if not self.received_date.nil?
      'completed'
    elsif not self.send_date.nil?
      'sent'
    else
      'wrong'
    end
  end
end
