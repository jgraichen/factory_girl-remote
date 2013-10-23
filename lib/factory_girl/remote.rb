require 'rack/remote'
require 'factory_girl'
require 'factory_girl/remote/version'

module FactoryGirl

  def self.remote(uri_or_symbol)
    Remote.new uri_or_symbol
  end

  class Remote
    attr_reader :remote

    def initialize(remote)
      @remote = remote
    end

    def invoke(method, attrs)
      Rack::Remote.invoke self.remote, :factory_girl_remote, {method: method, attrs: attrs}, { 'Accept' => 'application/json' }
    end

    class << self
      private
      def define_invoke_method(name)
        define_method name do |*attrs|
          send :invoke, name, attrs
        end
      end
    end

    [:create, :build, :attributes_for].each do |name|
      define_invoke_method "#{name}"
      define_invoke_method "#{name}_list"
    end
  end

  Rack::Remote.register :factory_girl_remote do |params, env, request|
    method = params.delete('method') { :create }
    attrs  = params.delete('attrs') { [] }
    FactoryGirl.send method, *attrs
  end
end
