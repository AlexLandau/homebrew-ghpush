#!/bin/bash

cat Formula/ghpush.rb | sed "s#^  url .*\$#  url \"$1\"#" | sed "s/^  sha256 .*$/  sha256 \"$2\"/" > Formula/ghpush.rb.tmp
mv Formula/ghpush.rb.tmp Formula/ghpush.rb
