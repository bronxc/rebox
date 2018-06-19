README.html: README.adoc
	asciidoc README.adoc
	sed -i -e 's|data:image/svg;|data:image/svg+xml;|g' README.html
	cp README.html index.html

all: README.html
	find ./ -name '*.bat' -exec unix2dos '{}' ';'
	find ./ -type f | grep -R -E '[0-9a-fA-F]{64}'
	./gen_summary.sh

