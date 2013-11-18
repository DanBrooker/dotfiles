#broken
rvmrc() {
  echo $RUBY_VERSION > .ruby-version;
  path=`pwd`;
  foldername=`basename $path`;
  echo $foldername > .ruby-gemset;
  cd ..;
  cd -;
}