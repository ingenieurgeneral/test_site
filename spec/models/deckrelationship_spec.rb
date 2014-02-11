require 'spec_helper'
describe Deckrelationship do
    let(:follower) { FactoryGirl.create(:user) }
    let(:followed_deck) { Deck.create(title: "voila un deck", author_id: 1, language: "english") }
    let(:deckrelationship) { follower.deckrelationships.build(followed_deck_id: followed_deck.id) }
    subject { deckrelationship }
    it { should be_valid }
    describe "follower methods" do
        it { should respond_to(:follower) }
        it { should respond_to(:followed_deck) }
        its(:follower) { should eq follower }
        its(:followed_deck) { should eq followed_deck }
    end
    describe "when followed_deck_id is not present" do
        before { deckrelationship.followed_deck_id = nil }
        it { should_not be_valid }
    end
    describe "when follower_id is not present" do
        before { deckrelationship.follower_id = nil }
        it { should_not be_valid }
    end
end