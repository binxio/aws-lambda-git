.PHONY: build invoke clean

invoke: build
	sam local invoke GitClient --event $(PWD)/event.json

build: libraries.zip
	sam build --use-container --cached

libraries.zip:
	docker rm -f git-builder
	docker build -t git-container $(PWD)/.
	docker run -d --name git-builder git-container
	docker cp git-builder:/tmp/libraries.zip $(PWD)
	unzip libraries.zip -d "$(PWD)/git_client/"

clean:
	[[ -f "$(PWD)/libraries.zip" ]] && rm "$(PWD)/libraries.zip" || True
	[[ -d "$(PWD)/git_client/bin" ]] && rm -rf "$(PWD)/git_client/bin" || True
	[[ -d "$(PWD)/git_client/lib" ]] && rm -rf "$(PWD)/git_client/lib" || True

$(VERBOSE).SILENT: