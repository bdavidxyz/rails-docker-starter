# DDD

"rails new" will
1) create directory structure
2) run bundle install
3) run webpacker:install

Unfortunately, "bundle install" is launched with the version tied to the Ruby version,
therefore the 3 steps must be separated
