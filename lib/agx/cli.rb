# frozen_string_literal: true

require 'thor'

module Agx
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'agx version'
    def version
      require_relative 'version'
      puts "v#{Agx::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'search', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def search(str)
      if options[:help]
        invoke :help, ['search']
      else
        require_relative 'commands/search'
        Agx::Commands::Search.new(str).execute
      end
    end
  end
end
