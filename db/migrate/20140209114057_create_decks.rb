class CreateDecks < ActiveRecord::Migration
	def change
		create_table :decks do |t|
			t.integer :author_id
			t.string  :title
			t.text    :description
			t.boolean :is_published, default: false
			t.boolean :is_featured,  default: false
			t.string  :language
			t.string  :country
			t.string  :level
			t.string  :subject
			t.string  :chapter
			t.float   :price
			t.integer :rating
			t.integer :difficulty
			t.integer :questionnaire_answers_count, default: 4

			t.timestamps
		end
	end
end
