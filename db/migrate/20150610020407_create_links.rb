class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :given_url
      t.string :uuid
      t.string :code

      t.timestamps
    end
  end
end
