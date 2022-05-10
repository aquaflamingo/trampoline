class AddBlobCipherTextToSecrets < ActiveRecord::Migration[7.0]
  def change
    add_column :secrets, :blob_ciphertext, :text
  end
end
