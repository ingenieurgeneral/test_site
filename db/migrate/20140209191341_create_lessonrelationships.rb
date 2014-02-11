class CreateLessonrelationships < ActiveRecord::Migration
	def change
		create_table :lessonrelationships do |t|
			t.integer :lesson_id
			t.integer :user_id
			t.integer :score
			t.datetime :time_spent

			t.timestamps
		end
		add_index :lessonrelationships, :lesson_id
		add_index :lessonrelationships, :user_id
		add_index :lessonrelationships, [:lesson_id,:user_id], unique: true
	end
end
