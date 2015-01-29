require 'bookbinder'
require 'optparse'

# The `bookbinder --version` command only works if running a locally bundled
# bookbinder project, not if the gem was installed via rubygems.
# For this reason, we're intercepting the version command and reporting the gem
# version.
def print_version
  gem_spec = Gem::Specification.find_by_name('bookbindery')
  puts "Bookbinder #{gem_spec.version}"
end

def run_bookbinder
  # Disabling HTTPS certificate verification to avoid these exceptions
  # when bookbinder is verifying connectivity to external resources
  # (e.g. css links).  Tried updating embedded openssl, but verification
  # still failed with latest cacert.pem.
  silence_warnings { OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE) } 

  return_code = Bookbinder::Cli.new.run ARGV
  exit return_code.to_i
end

OptionParser.new do |o|
  o.on('--version') { print_version; exit 0 }
  o.parse!
end

run_bookbinder
