module CapistranoDeploy
  module Rvm
    def self.load_into(configuration)
      configuration.load do
        $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
        require 'rvm/capistrano'

        if File.exists?('.rvmrc')
          matches = File.read('.rvmrc').scan(/^rvm\s+use\s+.*?([\w\-\.]+@[\w\-]+).*$/)
          if matches.any?
            set :rvm_ruby_string, matches.last.first
          end
        end
      end
    end
  end
end
