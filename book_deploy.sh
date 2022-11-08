work_path="/tmp/gh-pages"
work_docs_path="${work_path}/docs"

git worktree add -f $work_path

cd notes
mdbook build
rm -rf $work_docs_path+"/*" # this won't delete the .git directory

mkdir $work_docs_path
cp -rp book/* $work_docs_path
cd $work_path
sed -ie 's/**\/book//' .gitignore
git add -A
git commit -m 'deploy new book'
git push origin gh-pages
