#!bin/bash

GIT_FOLDER=$1
cd $GIT_FOLDER

if [ ! -d ".git" ] 
then
	echo $(git status)
	exit -1 
fi

SERVER_PATH="username@server:path"

chfiles=($(git ls-files -m))

for file in "${chfiles[@]}"
do
	path=$(echo "$file" | rev | sed 's/^[^\/]*\///' | rev )
	CMD="scp $file $SERVER_PATH/$path"
	echo $CMD
	#eval $CMD
done

