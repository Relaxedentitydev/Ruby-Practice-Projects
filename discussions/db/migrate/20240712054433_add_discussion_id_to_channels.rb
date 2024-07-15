class AddDiscussionIdToChannels < ActiveRecord::Migration[7.1]
  def change
    add_column :channels, :discussion_id, :integer
  end
end
