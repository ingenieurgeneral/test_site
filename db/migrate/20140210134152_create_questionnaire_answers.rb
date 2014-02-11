class CreateQuestionnaireAnswers < ActiveRecord::Migration
	def change
		create_table :questionnaire_answers do |t|
			t.references :questionnaire, index: true
			t.text :answer
			t.boolean :is_right, default: false

			t.timestamps
		end
	end
end
