#!/bin/bash 

set -e

function build {
	rm -rf dist/
	mkdir -p dist/sites-available
	mkdir -p dist/snippets

	SITES=""

	cd sites
	for template in *.erb; 
	do 
		echo "Generating ${template%.*}..."
		erb -r ../render.rb $template > ../dist/sites-available/${template%.*}
		SITES+="${template%.*} "
	done
	cd ..

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Build completed."
}

build
