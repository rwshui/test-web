# replace version
cd alist-web
version="3.0.0"
sed -i -e "s/0.0.0/3.0.0/g" package.json
cat package.json

# build
pnpm install
# pnpm i18n:release
pnpm build
cp -r dist ../
cd ..

# commit to web-dist
cd web-dist
rm -rf dist
cp -r ../dist .
git add .
git config --local user.email "i@nn.ci"
git config --local user.name "Noah Hsu"
git commit --allow-empty -m "upload 3.0.0 dist files" -a
git tag -a test3 -m "release 3.0.0"
cd ..

mkdir compress
tar -czvf compress/dist.tar.gz dist/*
zip -r compress/dist.zip dist/*