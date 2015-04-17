require "britecore_printer/version"
require "britecore_printer/britecore_doc_dir"
require "britecore_printer/britecore_doc"

module BritecorePrinter  
  def self.print(britecore_dir,printer)
    bdd = BritecoreDocDir.new(britecore_dir)
    bdd.get_and_redate_docs
    bdd.docs.sort.map{|bd| `lp -o sides=two-sided-long-edge -d #{printer} #{bd.terminal_path}` }
  end
  
  def self.show_docs(britecore_dir)
    bdd = BritecoreDocDir.new(britecore_dir)
    bdd.get_and_redate_docs
    bdd.docs.sort.map{|b| puts b}
  end
end
