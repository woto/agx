# frozen_string_literal: true

require_relative '../command'
require 'tty/tree'
require 'tty/reader'
require 'tty-prompt'
require 'tty-editor'
require 'active_support'
require 'active_support/core_ext/string/filters'
require 'ostruct'

module Navag
  module Commands
    class Config < Navag::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new
        print prompt.cursor.clear_screen
        print prompt.cursor.move_to(0, 0)
        @current_path = ['.']
        loop do
          branch = tree.dig(*@current_path)
          if branch.is_a?(Hash)
            answer = prompt.select(nil, branch.keys.sort, per_page: 40, cycle: true, filter: true)
            selected_name = answer.inspect.delete('\'"')
            @current_path << selected_name
            print prompt.cursor.clear_screen
            print prompt.cursor.move_to(0, 0)
            puts @current_path.join('/')
          else
            if @current_path[-1] == '..'
              @current_path.pop(2)
              print prompt.cursor.clear_screen
              print prompt.cursor.move_to(0, 0)
              puts @current_path.join('/')
            else
              print tree.dig(*@current_path).text.squish
              # TTY::Editor.open(content: tree.dig(*@current_path).text.squish)
              # TTY::Editor.open(content: tree.dig(*@current_path).text.squish)
              @current_path.pop
            end
          end
        end
      end

      private

      def tree
        return @tree if defined?(@tree)

        @tree = { '.' => {} }
        File.open('result.txt').each_line do |line|
          match = /(?<path>.+?):(?<line>.+?):(?<column>.+?):(?<text>.+)/.match(line)
          data = OpenStruct.new({
              line: match['line'],
              column: match['column'],
              text: match['text']
          })
          splitted = match['path'].split('/')
          @tree['.'].deep_merge!(undig(*splitted, data))
        end
        @tree
      end

      def undig(*keys, value)
        keys[0..-2].reverse_each.reduce ({ keys.last=>value, '..' => nil }) do |h, key|
          { key => h, '..' => nil }
        end
      end
    end
  end
end
