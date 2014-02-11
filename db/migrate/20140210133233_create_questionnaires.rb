class CreateQuestionnaires < ActiveRecord::Migration
	def change
		create_table :questionnaires do |t|
			t.references :deck, index: true
			t.text :question
			t.boolean :is_featured

			t.timestamps
		end
	end
end
