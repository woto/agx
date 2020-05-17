require 'navag/commands/config'

RSpec.describe Navag::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    options = {}
    command = Navag::Commands::Config.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
