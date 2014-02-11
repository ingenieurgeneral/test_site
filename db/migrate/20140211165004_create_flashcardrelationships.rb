class CreateFlashcardrelationships < ActiveRecord::Migration
	def change
		create_table :flashcardrelationships do |t|
			t.integer :flashcard_id
			t.integer :user_id
			t.integer :score
			t.datetime :time_spent

			t.timestamps
		end
		add_index :flashcardrelationships, :flashcard_id
		add_index :flashcardrelationships, :user_id
		add_index :flashcardrelationships, [:flashcard_id,:user_id], unique: true
	end
end
