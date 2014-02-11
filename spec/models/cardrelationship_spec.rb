require 'spec_helper'
describe Cardrelationship do
  let(:user) { FactoryGirl.create(:user) }
  let(:card) { Card.create(deck_id: 1, kind: "lesson", content: "some content") }
  let(:cardrelationship) { user.cardrelationships.build(card_id: card.id) }
  subject { cardrelationship }
  it { should be_valid }
  describe "user methods" do
    it { should respond_to(:user) }
    it { should respond_to(:card) }
    its(:user) { should eq user }
    its(:card) { should eq card }
  end
  describe "when card id is not present" do
    before { cardrelationship.card_id = nil }
    it { should_not be_valid }
  end
  describe "when user id is not present" do
    before { cardrelationship.user_id = nil }
    it { should_not be_valid }
  end
end