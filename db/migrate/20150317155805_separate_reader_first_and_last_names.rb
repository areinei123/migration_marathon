class SeparateReaderFirstAndLastNames < ActiveRecord::Migration
  class Reader < ActiveRecord::Base; end;

  def up
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string

    Reader.find_each do |reader|
      name = reader.name.split(" ")
      reader.first_name = name[0]
      reader.last_name = name[1..-1].join(" ")
      reader.save!
    end

    remove_column :readers, :name
  end

  def down
    add_column :readers, :name, :string

    Reader.find_each do |reader|
      reader.name = [reader.first_name, reader.last_name].join(' ')
      reader.save!
    end

    remove_column :readers, :first_name
    remove_column :readers, :last_name
  end
end
