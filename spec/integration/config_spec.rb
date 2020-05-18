RSpec.describe "`agx search` command", type: :cli do
  it "executes `agx help search` command successfully" do
    output = `agx help search`
    expected_output = <<-OUT
Usage:
  agx search

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
