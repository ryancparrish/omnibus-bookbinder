#
# Copyright 2015 Ryan Parrish
#
# All Rights Reserved.
#

name "bookbinder"
maintainer "Pivotal and the Cloud Foundry Community"
homepage "https://github.com/cloudfoundry-incubator/bookbinder"

build_iteration 1
build_version "1.0.1"

dependency "preparation"
dependency "bookbinder"
dependency "version-manifest"

override :ruby, version: "2.1.1"
override :nokogiri, version: "1.6.5"

if windows?
  # NOTE (from omnibus-chef):
  #       Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  #       Native gems will use gcc which will barf on files with spaces,
  #       which is only fixable if everyone in the world fixes their Makefiles
  #
  # Choosing C:/tools as install_dir to coincide with ruby-related
  # chocolatey.org packages.
  install_dir  "C:/tools/#{name}"
  package_name "bookbinder"
else
  install_dir "/usr/local/opt/#{name}"
end

#compress :dmg
