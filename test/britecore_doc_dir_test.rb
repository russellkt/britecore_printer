require 'minitest_helper'

describe BritecoreDocDir do
  
  before do 
    @bdd = BritecoreDocDir.new('test/Britecore Printer Backups')
  end
  
  after do
  end
  
  def test_that_valid_dirs_does_not_have_dot_entries
    @bdd.valid_dirs('test/Britecore Printer Backups').wont_include(".")
    @bdd.valid_dirs('test/Britecore Printer Backups').must_include("2015-04-01")
  end
  
  def test_that_newest_dir_returns_max_entry
    @bdd.newest_dir.must_equal('2015-04-07')
  end
  
  def test_that_path_returns_base_dir_and_newest
    @bdd.path.must_equal("test/Britecore Printer Backups/2015-04-07")
  end
  
  def test_that_policy_numbers_returns_policies
    @bdd.policy_numbers.must_include("A17532","A30646")
  end
  
  def test_that_docs_are_added
    @bdd.get_and_redate_docs
    @bdd.docs.size.must_equal(8)
  end
  
end
