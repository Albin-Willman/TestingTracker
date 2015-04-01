module TableHelper
  def generate_table(opts = {})
    TableBuilder.new(opts).generate
  end
end
