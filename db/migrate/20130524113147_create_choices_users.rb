class CreateChoicesUsers < ActiveRecord::Migration
  def change
        create_table :choices_users do |t|
      t.references :voter
      t.references :choice
      t.timestamps
    end
  end
end
