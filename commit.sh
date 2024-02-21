git add .
git commit -m 'fix bug'
git tag -d v1
git push --delete origin v1
git tag -a -m "Minimalistic GitHub action" v1
git push origin
git push --follow-tags