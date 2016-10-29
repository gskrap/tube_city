class AddUrlToClips < ActiveRecord::Migration
  def change
    add_column :clips, :url, :string, null: false
  end
end
