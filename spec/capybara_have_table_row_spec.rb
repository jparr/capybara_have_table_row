# frozen_string_literal: true

RSpec.describe CapybaraHaveTableRow do
  let(:table) { Capybara.string(File.read(File.expand_path("table.html", File.join(__dir__, "fixtures")))) }

  it "has a version number" do
    expect(CapybaraHaveTableRow::VERSION).not_to be nil
  end

  it "finds the table" do
    # expect(table).to have_table("Test Table")
    expect(table).to have_table("Test Table", with_rows: [%w[B1 C1]])
  end

  it "finds a row" do
    expect(table).to have_table_row({ "A" => "A1", "B" => "B1" })
    expect(table).to have_table_row(%w[A1 B1])
    expect(table).not_to have_table_row({ "A" => "wrong", "B" => "B1" })
    expect(table.find(:table, "Another")).to have_table_row({ "D" => "D1", "E" => "E1" })
    expect(table.find(:table, "Another")).not_to have_table_row({ "A" => "A1", "B" => "B1" })
  end

  it "has a helpful error message" do
    expect do
      expect(table.find(:table, "Another")).to have_table_row({ "A" => "wrong", "B" => "B1" })
    end.to raise_error RSpec::Expectations::ExpectationNotMetError, <<~MESSAGE.strip
      expected to find table_row {"A"=>"wrong", "B"=>"B1"} within #<Capybara::Node::Simple tag="table" path="/html/body/table[2]"> but there were no matches in:#{" "}

      +----+----+----+
      | D  | E  | F  |
      +----+----+----+
      | D1 | E1 | F1 |
      +----+----+----+
    MESSAGE
  end
end
