require 'minitest_helper'

describe BritecoreDoc do
  
  before do 
    @bdd = BritecoreDoc.new('A17532','002_04-07-2015 - Renewal Billing Statement.pdf',"/Volumes/Apps/Britecore Print Backups/2015-04-10/G20448/001_04-09-2015 - Continuation of Coverage - NonPay.pdf")
    @sample_path = "002_04-07-2015 - Renewal Billing Statement"
  end
  
  after do
  end
  
  def test_that_name_from_path_returns_name
    @bdd.name_from_path(@sample_path).must_equal('Renewal Billing Statement')
  end
  
  def test_that_print_date_gets_date_from_path    
    @bdd.print_date_from_path(@sample_path).must_equal('2015-04-07')
  end
  
  def test_terminal_path_adds_backslashes_to_space
    @bdd.terminal_path.must_equal("/Volumes/Apps/Britecore\\ Print\\ Backups/2015-04-10/G20448/001_04-09-2015\\ -\\ Continuation\\ of\\ Coverage\\ -\\ NonPay.pdf")
  end
    
end