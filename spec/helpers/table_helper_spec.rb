require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TableHelper. For example:
#
# describe TableHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TableHelper, type: :helper do

  let (:header_opts) { { header: ['test1', 'test2', 'test3'] } }
  let (:header_html) { "<thead><tr><th>test1</th><th>test2</th><th>test3</th></tr></thead>" }

  it 'creates and calls a table generator' do
    opts = {
      header: ['test1', 'test2', 'test3'],
      content: [[1,2,3],[2,3,5],[3,5,8]]
    }
    expect(generate_table(opts)).to eq(TableHelper::TableBuilder.new(opts).generate)
  end

  it 'generates headers for tables' do
    opts = header_opts
    expect(generate_table(opts)).to eq("<table class=\"table\">#{header_html}</table>")
  end

end
