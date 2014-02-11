class CreateDeckrelationships < ActiveRecord::Migration
	def change
		create_table :deckrelationships do |t|
			t.integer :followed_deck_id
			t.integer :follower_id
			t.integer :individual_rating
			t.integer :personal_score
			t.datetime :time_spent
			t.timestamps
		end
		add_index :deckrelationships, :followed_deck_id
		add_index :deckrelationships, :follower_id
		add_index :deckrelationships, [:followed_deck_id, :follower_id], unique: true
	end
end
