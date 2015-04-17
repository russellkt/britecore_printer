$LOAD_PATH.unshift File.expand_path('../../test', __FILE__)
require 'minitest_helper'

class BritecorePrinterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BritecorePrinter::VERSION
  end

end
