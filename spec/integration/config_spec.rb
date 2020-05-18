RSpec.describe "`agx config` command", type: :cli do
  it "executes `agx help config` command successfully" do
    output = `agx help config`
    expected_output = <<-OUT
Usage:
  agx config

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
