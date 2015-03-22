module TableHelper
  def generate_table(opts = {})
    TableBuilder.new(opts).generate
  end

  class TableBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    def initialize(opts = {})
      @opts = opts
    end

    def generate
      content_tag :table, class: table_class do
        safe_join([
          table_header
        ])
      end
    end

    private

    def table_header
      return unless header = @opts[:header]
      content_tag :thead do
        table_row(true, header)
      end
    end

    def table_row(header, elements)
      return unless elements
      content_tag :tr do
        safe_join(elements.map { |e| table_cell(header, e) })
      end
    end

    def table_cell(header, element)
      tag_type = header ? :th : :tr
      content_tag tag_type do
        element
      end
    end

    def table_class
      'table'
    end
  end

end
