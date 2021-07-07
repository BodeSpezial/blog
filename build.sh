#!/bin/sh

# clean up the build folder
if [ -d "public" ]; then
    echo "clean public folder"
    rm -rf public
fi

# build the site
echo "build website"
hugo

# push the site to the cloud instance
# send the files from the `public` folder to the server known as `uberspace`
# include the files [r]ecursively, give [v]erbose output
# delete files that don't exist in the local folder
# [a]rchive and [z] compress the files for the transfer
echo "put site on server"
rsync --delete -avzr public/* uberspace:html/

# delete the build folder
echo "clean public folder"
rm -rf public

