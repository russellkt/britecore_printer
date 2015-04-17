class BritecoreDocDir
  
  def initialize dir
    @base_dir = dir
    set_newest_dir()
    set_policy_numbers()
  end
  
  def base_dir
    @base_dir
  end
  
  def newest_dir
    @newest_dir
  end
  
  def set_newest_dir
    @newest_dir = valid_dirs(@base_dir).max
  end
  
  def valid_dirs dir
    Dir.entries(dir).select{|f| !f.start_with?(".") && File.directory?("#{dir}/#{f}") }
  end
  
  #TODO Create better and more robust method to get valid files
  def valid_files dir
    Dir.entries(dir).select{|f| f =~ /^[0-9]/; }
  end
  
  def policy_numbers
    @policy_numbers
  end
  
  def set_policy_numbers
    @policy_numbers = valid_dirs(path)
  end
  
  def path 
    File.join(@base_dir,@newest_dir)
  end
  
  def get_and_redate_docs 
    @docs = []
    policy_numbers.each do |policy_number|
      max_date = "0000-00-00"
      valid_files("#{path}/#{policy_number}").each do |f|
        begin
          bdoc = BritecoreDoc.new( policy_number, 
                                  f,
                                  File.join(path,policy_number,f)
                                  )                     
          max_date = bdoc.print_date if bdoc.print_date > max_date                        
          bdoc.print_date = max_date 
          add_doc(bdoc)                                
        rescue Exception => e
          puts e.message
        end
      end
    end
  end
  
  def add_doc doc
    @docs.push(doc)
  end 
  
  def docs
    @docs
  end   
end