require 'active_record'
require 'fileutils'
require 'sqlite3'

require_relative '../lib/difference.rb'

FileUtils.rm_f 'test/setup/db/test.sqlite3'

ActiveRecord::Base.establish_connection(
   :adapter   => 'sqlite3',
   :database  => './test/setup/db/test.sqlite3'
)

ActiveRecord::Migration.class_eval do
  create_table :fake_users do |t|
    t.string  :name
    t.text :address
   end
end
