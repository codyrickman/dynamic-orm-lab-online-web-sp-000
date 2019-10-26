require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql = <<-SQL
            PRAGMA table_info(?)
            SQL
    DB[:conn].execute(sql, self.table_name)
  end

end
