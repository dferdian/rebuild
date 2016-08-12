require "connection_adapter"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *args)
      columns = @@connection.columns(self.class.table_name)
      if columns.include?(name)
        attributes[name]
      else
        super
      end
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
    end

    def self.all
      find_by_sql("SELECT * FROM #{table_name}")
    end

    def self.table_name
      name.downcase + "s"
    end

    private

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)
      rows.map do |attribute|
        new(attribute)
      end
    end

    attr_reader :attributes
  end
end
