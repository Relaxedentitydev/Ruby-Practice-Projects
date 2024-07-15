class AddChannelIdToDiscussions < ActiveRecord::Migration[7.1]
  def change
    add_column :discussions, :channel_id, :integer
  end
end
