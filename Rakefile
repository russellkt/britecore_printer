require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
end

desc "Show docs that are to be printed"
task :show_docs, [:dir] do |t,args|
  BritecorePrinter.show_docs(args.dir)
end

desc "Print files to a printer"
task :print, [:dir,:printer] do |t,args|
  BritecorePrinter.print(args.dir,args.printer)
end