Generate the puppet types on a centos 6 box
===========================================

```bash
# add software collection
sudo yum install -y centos-release-SCL

# install ruby193
sudo yum install -y ruby193

# Default to ruby193
echo "source /opt/rh/ruby193/enable" | sudo tee -a /etc/profile.d/ruby193.sh
source /etc/profile.d/ruby193.sh

# install build tools and libs
sudo yum install -y gcc gcc-c++ ruby193-ruby-devel libicu-devel zlib-devel libxml2 libxml2-devel libxslt libxslt-devel

# install git
sudo yum install -y git

# clone the dsc repo and cd into it
git clone https://github.com/msutter/puppet-dsc.git
cd puppet-dsc

# install bundler
gem install bundler

# Use system libs to avoid issues with the nokogiri build
bundle config build.nokogiri --use-system-libraries

# Exclude debugging/development gems
bundle config --local without development

# install the needed gems
bundle install

# fire the generation
bundle exec rake

```
