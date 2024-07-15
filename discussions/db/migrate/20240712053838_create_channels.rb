class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :channel

      t.timestamps
    end
  end
end
