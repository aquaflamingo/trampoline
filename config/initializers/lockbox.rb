# frozen_string_literal: true

# FIXME: You will need to update your lockbox key via:
#   1. bundle exec rails console
#     a. Lockbox.generate_key
#     b. Copy
#   2. bundle exec rails credentials:edit
#     a. lockbox_key: 'value-from-generate-key'
Lockbox.master_key = Rails.application.credentials.lockbox_key
