name "bookbinder"

#source git: "https://github.com/ryancparrish/bookbinder-wrapper"
#default_version "master"
source_path = "#{Omnibus::Config.project_root}/resources/bookbinder/wrapper-app"
source path: source_path

dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "nokogiri"  # called out as omnibus dep here so that omnibus builds and bundles native libs
dependency "sqlite3"   # have omnibus bundle sqlite3 native libs

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Budnle the wrapper app dependencies
  bundle "install"

  # Make sure the wrapper app is placed in the bin dir of the installer package.
  copy "#{source_path}/*", "#{install_dir}/bin"

  # Hardcopied the ruby delcaration in the script, since the omnibus templating failed.
  #  erb source: 'bookbinder.erb',
  #      dest:   "#{install_dir}/bin",
  #      vars:   { install_dir: "#{install_dir}" },
  #      mode:   '0755'

  command "chmod +x #{install_dir}/bin/bookbinder"

end
