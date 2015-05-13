module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
    base.acts_as_csv
  end

  module ClassMethods

    def acts_as_csv
      include InstanceMethods
    end

  end

  module InstanceMethods

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new filename
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each
      @csv_contents.each {|row| yield CsvRow.new(@headers, row)}
    end

  end

  class CsvRow

    def initialize(headers, row)
      @headers = headers
      @row = row
    end

    def method_missing column
      column_number = @headers.index(column.to_s)
      return @row[column_number] unless column_number.nil?
      super
    end

  end

end

class RubyCsv
  include ActsAsCsv
end

m = RubyCsv.new
m.each {|row| puts row.one}
