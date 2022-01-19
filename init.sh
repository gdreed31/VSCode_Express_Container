echo 'Do you want to create a (n)ew Express project or (c)lone one from git?'
read new_or_clone

if [ $new_or_clone == 'n' ]
then
    echo What is your project name?  all-lowercase-no-spaces
    read app_name
    mkdir $app_name
    cd $app_name
    touch .env
    touch server.js
    echo '.env' > .gitignore
    echo 'node_modules' >> .gitignore

    # Install dev and testing tools
    npm init -y
    npm i express
    npm i mongoose
    npm i cors
    npm i --save-dev dotenv
    npm i --save-dev nodemon
    npm audit fix
fi

if [ $new_or_clone == 'c' ]
then
    echo What is your git repo url?
    read git_url
    git clone $git_url
fi

if [ $new_or_clone != 'c' ] && [ $new_or_clone != 'n' ]
then
    echo "Please re-run and follow directions!"
fi
