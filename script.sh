set -e

if [ ! -n "$TQT" ]; then
  TQT=~/.tqt
  TQT_CLONE=$TQT\/clone
fi

rm -rf $TQT_CLONE;

GIT_URL="https://github.com/indigotech/tqt.git"
GIT_BRANCH="master"

if [[ $1 =~ pre ]]; then
  GIT_BRANCH="develop"
fi

echo "\033[0;32mCloning tqt ($GIT_BRANCH)...\033[0m"

hash git >/dev/null 2>&1 && env git clone --depth=1 $GIT_URL $TQT_CLONE -b $GIT_BRANCH || {
  echo "git not installed"
  exit
}

echo
echo "\033[0;32mInstalling gem...\033[0m"
cd $TQT_CLONE;

# Remove previous versions
gem uninstall tqt -ax

# Build the gem
gem build -V tqt.gemspec;

# Install the gem
gem install `ls *.gem` --no-ri --no-rdoc;

rm -rf $TQT_CLONE;


echo "\033[0;32m"'                                  '"\033[0m"
echo "\033[0;32m"'                                  '"\033[0m"
echo "\033[0;32m"'   $$$$$$$$\  $$$$$$\ $$$$$$$$\   '"\033[0m"
echo "\033[0;32m"'   \__$$  __|$$  __$$\\__$$  __|  '"\033[0m"
echo "\033[0;32m"'      $$ |   $$ /  $$ |  $$ |     '"\033[0m"
echo "\033[0;32m"'      $$ |   $$ |  $$ |  $$ |     '"\033[0m"
echo "\033[0;32m"'      $$ |   $$ |  $$ |  $$ |     '"\033[0m"
echo "\033[0;32m"'      $$ |   $$ $$\$$ |  $$ |     '"\033[0m"
echo "\033[0;32m"'      $$ |   \$$$$$$ /   $$ |     '"\033[0m"
echo "\033[0;32m"'      \__|    \___$$$\   \__|     '"\033[0m"
echo "\033[0;32m"'                  \___|           '"\033[0m"
echo "\033[0;32m"'                                  '"\033[0m"
echo "\033[0;32m"'   ============================   '"\033[0m"
echo "\033[0;32m"'  | WAS SUCCESSFULLY INSTALLED |  '"\033[0m"
echo "\033[0;32m"'   ============================   '"\033[0m"
