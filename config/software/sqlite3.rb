
name "sqlite3"
default_version "3080704"

version "3080704" do
  source :md5 => "33bb8db0038317ce1b0480ca1185c7ba"
end

source :url => "http://www.sqlite.org/2014/sqlite-autoconf-#{version}.tar.gz"

relative_path "sqlite-autoconf-#{version}"

config_env = {
   "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
   "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
   "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./configure --prefix=#{install_dir}/embedded --disable-readline", :env => config_env
  command "make -j #{workers}", :env => config_env
  command "make install"
end

