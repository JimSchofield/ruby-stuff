module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = 'test.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each(&block)
      block.call self
    end

    # TODO: I have no idea how to make this work
    def method_missing(name, *args, &block)
      @headers.find_index name.to_s
    end
  end
end

class RubyCsv # no inheritance! You can mix it in include ActsAsCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each { |row| puts row.one }
