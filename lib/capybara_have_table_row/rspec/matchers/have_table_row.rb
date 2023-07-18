# frozen_string_literal: true

require "capybara/rspec/matchers"
require "terminal-table"
require "xpath"

module Capybara
  module RSpecMatchers
    module Matchers
      class HaveTableRow < HaveSelector
        # rubocop:disable Metrics/AbcSize
        def failure_message
          rendered_tables = @context_el.all(:xpath, XPath.descendant_or_self(:table)).map do |table|
            rows = table.all("tr").map do |row|
              row.all("th, td").map do |cell|
                { value: cell.text, colspan: (cell[:colspan] || 1).to_i }
              end
            end
            Terminal::Table.new(headings: rows.first, rows: rows.drop(1), style: { all_separators: true }).to_s
          end

          @failure_message + " in: \n\n#{rendered_tables.join("\n\n")}"
        end
        # rubocop:enable Metrics/AbcSize
      end
    end
  end
end
