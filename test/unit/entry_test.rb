require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_create_and_save_entry 
    ## SETUP
    entry = Entry.new
    entry.title = 'First Entry Title'
    entry.body = 'This is the content of the first entry'
    entry.save!

    ## START TEST
    assert_equal 1, Entry.count
    assert_equal 'First Entry Title', Entry.first.title
  end

  def test_destroying_of_entry
    ## SETUP
    entry = Entry.new
    entry.title = 'Entry To Be Deleted'
    entry.body = 'This is an entry meant to be deleted'
    entry.save!

    ## START TEST
    assert_equal 1, Entry.count
    Entry.first.destroy
    assert_equal 0, Entry.count
  end

  def test_searching_of_entries
    ## SETUP
    first_entry = Entry.new
    first_entry.title = 'First Entry'
    first_entry.body = 'This is the first entry'
    first_entry.save!

    second_entry = Entry.new
    second_entry.title = 'Second Entry'
    second_entry.body = 'This is the second entry'
    second_entry.save!

    ## START TEST
    assert_equal 2, Entry.count
    first_query = Entry.search 'entry'
    assert_equal 2, first_query.size
  end
end
