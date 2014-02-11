class CreateMcqrelationships < ActiveRecord::Migration
	def change
		create_table :mcqrelationships do |t|
			t.integer :mcq_id
			t.integer :user_id
			t.integer :score
			t.datetime :time_spent

			t.timestamps
		end
		add_index :mcqrelationships, :mcq_id
		add_index :mcqrelationships, :user_id
		add_index :mcqrelationships, [:mcq_id,:user_id], unique: true
	end
end
