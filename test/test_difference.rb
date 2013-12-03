require 'minitest/autorun'
require_relative 'test_helper'

class FakeUser < ActiveRecord::Base
  def self.needs_attr_accessible?
    ActiveRecord::VERSION::MAJOR == 3
  end

  if needs_attr_accessible?
    attr_accessible :name, :address
  end
end

class TestDifference < MiniTest::Test
  def setup
    @john = FakeUser.create(:name => 'john', :address => 'NYC')
    @smith = FakeUser.create(:name => 'smith', :address => 'NYC')
  end

  def test_john_and_smith_not_matching_on_id_and_name
    assert_equal({:id => [@john.id, @smith.id], :name=>["john", "smith"]}, @john.differs_from(@smith))
  end

  def test_john_and_smith_not_matching_on_name
    assert_equal({:name=>["john", "smith"]}, @john.differs_from(@smith, :ignore_attributes => [:id, :created_at]))
  end

  def test_john_and_smith_matching_on_address
    assert_equal({}, @john.differs_from(@smith, :only_attributes => [:address]))
  end
end
