RSpec.describe "`navag config` command", type: :cli do
  it "executes `navag help config` command successfully" do
    output = `navag help config`
    expected_output = <<-OUT
Usage:
  navag config

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
