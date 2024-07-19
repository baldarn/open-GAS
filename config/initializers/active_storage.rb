# frozen_string_literal: true

ActiveSupport.on_load(:active_storage_blob) do
  ActiveStorage::DiskController.after_action only: :show do
    expires_in 1.year, public: true
  end
end
