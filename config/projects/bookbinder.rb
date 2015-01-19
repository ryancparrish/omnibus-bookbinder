#
# Copyright 2015 Ryan Parrish
#
# All Rights Reserved.
#

name "bookbinder"
maintainer "Pivotal and the Cloud Foundry Community"
homepage "https://github.com/cloudfoundry-incubator/bookbinder"

build_iteration 1
build_version "1.0.0"

dependency "preparation"
dependency "bookbinder"
dependency "version-manifest"

override :ruby, version: "2.1.1"
override :nokogiri, version: "1.6.5"

if windows?
  # NOTE: Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  #       Native gems will use gcc which will barf on files with spaces,
  #       which is only fixable if everyone in the world fixes their Makefiles
  install_dir  "#{default_root}/cloudfoundry/#{name}"
  package_name "bookbinder"
else
  install_dir "#{default_root}/#{name}"
end

compress :dmg
