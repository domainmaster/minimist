# https://github.com/luizdepra/hugo-coder/blob/master/Makefile

.PHONY: prepare release build demo clean

build: prepare
	hugo --source demo

demo: prepare
	hugo server --buildDrafts --source demo

release: build
	rm -rf ./resources && cp -r ./demo/resources ./resources

prepare: clean
	mkdir -p demo/themes/minimist
	rsync -av exampleSite/ demo
	rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/minimist

clean:
	rm -rf demo