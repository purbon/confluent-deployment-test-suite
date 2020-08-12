class Specinfra::Command::Linux::Base < Specinfra::Command::Base
end

class Specinfra::Command::Base::Keystore < Specinfra::Command::Base::File
end


class Specinfra::Command::Linux::Base::Keystore < Specinfra::Command::Base::Keystore
  class << self
    def get_file(file, password)
     "keytool -v -list -keystore #{file} -storepass #{password}"
   end
  end
end
