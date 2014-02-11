class Deckrelationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
	belongs_to :followed_deck, class_name: "Deck"
	validates :follower_id, presence: true
	validates :followed_deck_id, presence: true
end
