require 'agx/commands/search'

RSpec.describe Agx::Commands::Search do
  it "executes `search` command successfully" do
    output = StringIO.new
    options = {}
    command = Agx::Commands::Search.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
