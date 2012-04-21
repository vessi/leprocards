class PostcardsController < ApplicationController
  before_filter :authorize
  def send_card
  end

  def receive_card
  end

  def sent_cards

  end

  def received_cards
    @postcards = Postcard.find_all_by_receiver_id(current_user.id)
  end
end
