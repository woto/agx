require 'agx/commands/config'

RSpec.describe Agx::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    options = {}
    command = Agx::Commands::Config.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
