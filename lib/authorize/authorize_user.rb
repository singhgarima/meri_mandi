require 'securerandom'
module Authorize
  module User
    def password_key(password)
      "#{mobile}-#{remember_token}-#{password}"
    end

    def password=(value)
      remember_token = SecureRandom.hex(32)
      encrypted_password = Digest::SHA1.hexdigest(password_key(value))
    end

    def authenticated?(password)
      encrypted_password == Digest::SHA1.hexdigest(password_key(password))
    end

    def authenticate(identifier, password)
      if (user = self.find_by_mobile(identifier))
        if password.present? && user.authenticated?(password)
          return user
        end
      end
    end
  end
end