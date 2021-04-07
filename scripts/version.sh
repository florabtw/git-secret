set -e

USERNAME=ncpierson
IMAGE=git-secret

git pull

version=`cat .version`
echo "Curent version: $version"
read -p "New version: " version

echo $version > .version

echo "Using version: $version"

git add .version
git commit -m "v$version"

git push
git push --tags
