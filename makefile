CC=nim
CFLAGS=js --stackTrace:on --lineTrace:on --threads:off --objChecks:on  --fieldChecks:on --rangeChecks:on --boundChecks:on --overflowChecks:on --assertions:on --floatChecks:on --nanChecks:on --infChecks:on --deadCodeElim:on --opt:speed --colors:on --warnings:on --hints:on
all:
	pacman
	ghost


ghost:
	mkdir -p bin
	mkdir -p bin/ghost
	sed -e 's/$$$type$$$/ghost/g' src/index.html > bin/ghost/index.html
	cp src/map.css bin/ghost/map.css
	cp src/interface.js bin/ghost/interface.js

pacman:
	mkdir -p bin
	mkdir -p bin/pacman
	sed -e 's/$$$type$$$/pacman/g' src/index.html > bin/pacman/index.html
	cp src/map.css bin/pacman/map.css
	cp src/interface.js bin/ghost/interface.js

clean:
	rm -r bin