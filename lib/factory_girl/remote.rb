require 'factory_girl/remote/version'

module FactoryGirl

  def remote(uri_or_symbol)
    Remote.new uri_or_symbol
  end

  class Remote
    attr_reader :remote

    def initialize(remote)
      @remote = remote
    end

    [:create, :build, :attributes_for].each do |name|
      define_method "#{name}" do |*attrs| send :invoke, name.to_s, attrs end
      define_method "#{name}_list" do |*attrs| send :invoke, "#{name}_list", attrs end
    end

    def invoke(method, attrs)
      Rack::Remote.invoke self.remote, :factory_girl_remote, attrs
    end
  end
end
