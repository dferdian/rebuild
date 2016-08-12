require "connection_adapter"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def id
      attributes[:id]
    end

    def name
      attributes[:name]
    end

    def self.find(id)
      find_by_sql("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
    end

    def self.all
      find_by_sql("SELECT * FROM users")
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
