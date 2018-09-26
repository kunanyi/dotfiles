#!/bin/sh

git branch --merged
echo

read -p "Do you want to delete these branches? [y|n]" -n 1 confirmation
echo

case "$confirmation" in
  n|N) exit 0;;
esac

echo
echo "Dropping all branches"
echo

branches=$(git branch --merged | wc -l)
for index in $(seq 1 $branches)
do
  git branch --merged
done

echo
echo "Dropped all branches"
