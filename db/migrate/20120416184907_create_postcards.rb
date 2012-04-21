class CreatePostcards < ActiveRecord::Migration
  def change
    create_table :postcards do |t|
      t.belongs_to :sender
      t.belongs_to :receiver
      t.date :send_date
      t.date :received_date
      t.timestamps
    end
  end
end
