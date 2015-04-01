require 'rails_helper'

RSpec.describe TableHelper, type: :helper do

  it 'creates and calls a table generator' do
    opts = {
      header: ['test1', 'test2', 'test3'],
      content: [["1",2,3],[2,3,5],[3,5,8]]
    }
    expect(generate_table(opts)).to eq(TableBuilder.new(opts).generate)
  end
end
