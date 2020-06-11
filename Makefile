build:
	docker buildx bake -f bake.hcl --push

set-version:
	sh ./version.sh

update:
	rm -rf ./tmp
	mkdir -p ./tmp
	wget -O ./tmp/gn.zip https://chrome-infra-packages.appspot.com/dl/gn/gn/mac-amd64/+/latest
	cd ./tmp && unzip gn.zip
	cp ./tmp/gn /usr/local/bin/gn
		