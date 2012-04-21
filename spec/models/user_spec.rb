require 'spec_helper'

describe User do
  it { should validate_presence_of :password }
  it { should validate_presence_of :email }
  it { should have_many :sent_cards }
  it { should have_many :received_cards}
end