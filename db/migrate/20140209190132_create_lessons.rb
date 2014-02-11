class CreateLessons < ActiveRecord::Migration
	def change
		create_table :lessons do |t|
		t.integer :deck_id
		t.string :title
		t.text :content
		t.boolean :is_featured, default: false

		t.timestamps
		end
	end
end
