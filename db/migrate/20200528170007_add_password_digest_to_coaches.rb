class AddPasswordDigestToCoaches < ActiveRecord::Migration[6.0]
  def change
    add_column :coaches, :password_digest, :string
  end
end
