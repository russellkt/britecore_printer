class BritecoreDoc
  attr_accessor :print_date, :policy_number, :name, :path, :fullpath
  
  def initialize(policy_number,path,fullpath)
    @policy_number = policy_number
    name_from_path(path)
    print_date_from_path(path)
    @fullpath = fullpath
  end
  
  def name_from_path(path)
    path_split = path.split(" - ",0)
    @name = path_split[1]
  end
  
  def print_date_from_path(path)
    path_split = path.split(" - ",0)
    date_split = path_split[0]
    month,day,year = date_split.split("_")[1].split("-") 
    @print_date = "#{year.to_s.strip()}-#{month}-#{day}" 
  end
  
  def terminal_path
    fullpath.gsub(/\s/,'\\ ') if fullpath
  end
  
  def to_s
    "#{@print_date} #{@policy_number} #{@name}"
  end
  
  def <=> bd
    #compare print date
    print_date_cmp = print_date <=> bd.print_date
    return print_date_cmp unless print_date_cmp == 0
    #compare policy number
    policy_number_cmp = policy_number <=> bd.policy_number
    return policy_number_cmp unless policy_number_cmp == 0
    #compare name
    name_cmp = name.to_s <=> bd.name.to_s
    return name_cmp
  end
end