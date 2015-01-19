name "bookbinder"

source git: "https://github.com/ryancparrish/bookbinder-wrapper"
default_version "master"

dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "nokogiri"  # called out as omnibus dep here so that omnibus builds and bundles native libs
dependency "sqlite3"   # have omnibus bundle sqlite3 native libs

build do
  env = with_standard_compiler_flags(with_embedded_path)
  bundle "install"
  copy("#{Omnibus::Config.project_root}/bookbinder-scripts/*", "#{install_dir}/bin")
#  copy("#{Omnibus::Config.project_root}/bookbinder-scripts/Gemfile*", "#{install_dir}/bin")
#  erb source: 'bookbinder.erb',
#      dest:   "#{install_dir}/bin",
#      vars:   { install_dir: "#{install_dir}" },
#      mode:   '0755'
end
