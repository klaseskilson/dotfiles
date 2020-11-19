# Search and replace
# usage: sar folder replacethis withthis
sar() {
  FOLDER=$1
  OLD=$2
  NEW=$3
  ag -l "$OLD" $FOLDER | xargs sed -i "" "s/$OLD/$NEW/g"
}
