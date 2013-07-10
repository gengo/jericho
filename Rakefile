require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

VERSION = "0.2.0"
JERICHO_CSS = "jericho-#{VERSION}.css"
JERICHO_MIN_CSS = "jericho-#{VERSION}.min.css"
JERICHO_RESPONSIVE_CSS = "jericho-responsive-#{VERSION}.css"
JERICHO_RESPONSIVE_MIN_CSS = "jericho-responsive-#{VERSION}.min.css"
# crate files in doc repo
JERICHO_DOCS_CSS = "./docs/assets/css/jericho.css"
JERICHO_RESPONSIVE_DOCS_CSS = "./docs/assets/css/jericho-responsive.css"


SASS_COMMAND = "sass --precision 16 --load-path lib --style"

task JERICHO_CSS do |target|
  sh "#{SASS_COMMAND} expanded lib/jericho.scss:#{target}"
  css = IO.read(target.to_s)
  css.gsub!('@DATE', `date`.strip)
  File.open(target.to_s, 'w+') { |f| f.write(css) }
end

task JERICHO_DOCS_CSS do |target|
  sh "#{SASS_COMMAND} expanded lib/jericho.scss:#{target}"
  css = IO.read(target.to_s)
  css.gsub!('@DATE', `date`.strip)
  File.open(target.to_s, 'w+') { |f| f.write(css) }
end


task JERICHO_MIN_CSS do |target|
  sh "#{SASS_COMMAND} compressed lib/jericho.scss:#{target}"
end


task JERICHO_RESPONSIVE_DOCS_CSS do |target|
  sh "#{SASS_COMMAND} expanded lib/responsive.scss:#{target}"
  css = IO.read(target.to_s)
  css.gsub!('@DATE', `date`.strip)
  File.open(target.to_s, 'w+') { |f| f.write(css) }
end

task JERICHO_RESPONSIVE_CSS do |target|
  sh "#{SASS_COMMAND} expanded lib/responsive.scss:#{target}"
  css = IO.read(target.to_s)
  css.gsub!('@DATE', `date`.strip)
  File.open(target.to_s, 'w+') { |f| f.write(css) }
end

task JERICHO_RESPONSIVE_MIN_CSS do |target|
  sh "#{SASS_COMMAND} compressed lib/responsive.scss:#{target}"
end


desc "build regular and compresed versions of jericho"
task :build => [JERICHO_CSS, JERICHO_MIN_CSS, JERICHO_RESPONSIVE_CSS, JERICHO_RESPONSIVE_MIN_CSS, JERICHO_DOCS_CSS, JERICHO_RESPONSIVE_DOCS_CSS]

desc "rebuild regular version of jericho when modifications are made"
task :watch do
  sh "#{SASS_COMMAND} expanded --watch lib/jericho.scss:#{JERICHO_CSS} lib/jericho.scss:#{JERICHO_DOCS_CSS} lib/jericho.scss:#{JERICHO_RESPONSIVE_CSS} lib/jericho.scss:#{JERICHO_RESPONSIVE_DOCS_CSS}"
end

task :default => :build
