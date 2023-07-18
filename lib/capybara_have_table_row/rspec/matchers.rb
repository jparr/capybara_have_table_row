# frozen_string_literal: true

require_relative "matchers/have_table_row"

module Capybara
  module RSpecMatchers
    #   RSpec matcher for table row elements.
    #   @param [Array<String>, Hash<String, String>] locator Array of row values or hash of headers with matching cell
    #   @example have_table_row({"A" => "a1", "B" => "b1" })
    #   @example have_table_row(["a1", b1"])
    #   @see Capybara::Selector :table_row
    define_method "have_table_row" do |locator = nil, **options, &optional_filter_block|
      Matchers::HaveTableRow.new(:table_row, locator, **options, &optional_filter_block)
    end
  end
end
