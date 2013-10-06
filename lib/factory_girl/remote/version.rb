module FactoryGirl
  class Remote
    module VERSION
      MAJOR = 1
      MINOR = 0
      PATCH = 0
      STAGE = 'dev1'
      STRING = [MAJOR, MINOR, PATCH, STAGE].reject(:nil?).join('.')

      def self.to_s; STRING end
    end
  end
end
