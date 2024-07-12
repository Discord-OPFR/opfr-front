if { git log "$( git describe --always --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -i -E '^feat|perf|refactor|revert$' ; } then
  npx commit-and-tag-version -t '';
elif { git log "$( git describe --always --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -i -E '^fix' ; } then
  npx commit-and-tag-version --release-as patch -t '';
else
  echo "No applicable changes since the previous tag, skipping..."
fi