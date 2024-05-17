version ?= 0.9.0

ci: clean deps lint package

clean:
	rm -rf bin .bundle .tmp Puppetfile.lock Gemfile.lock .gems modules packer_cache stage logs/

stage:
	mkdir -p stage/ stage/custom/ stage/user-config/ stage/certs/ logs/

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

release: release-minor

# resolve dependencies from remote artifact registries
deps:
	gem install bundler --version=2.3.21
	bundle install --binstubs -j4
	bundle exec r10k puppetfile install --verbose --moduledir modules
	pip3 install -r requirements.txt
