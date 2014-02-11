class AddIndicesToLessonsAndFlashcards < ActiveRecord::Migration
	def change
		add_index :lessons, :deck_id
		add_index :flashcards, :deck_id
	end
end
