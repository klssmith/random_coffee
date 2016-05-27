require 'rails_helper'

RSpec.describe Match, type: :model do
  it { is_expected.to belong_to(:member1).class_name("Member") }
  it { is_expected.to belong_to(:member2).class_name("Member") }
end
