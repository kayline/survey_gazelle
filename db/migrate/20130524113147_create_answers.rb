class CreateAnswers < ActiveRecord::Migration
  def change
        create_table :answers do |t|
      t.references :voter
      t.references :choice
      t.timestamps
    end
  end
end
