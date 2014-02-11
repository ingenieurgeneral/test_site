class CreateFlashcards < ActiveRecord::Migration
	def change
		create_table :flashcards do |t|
			t.integer :deck_id
			t.text :question
			t.text :answer
			t.boolean :is_featured, default: false

			t.timestamps
		end
	end
end
