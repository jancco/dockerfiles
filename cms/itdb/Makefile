build:
	cp -rf ../../files .
	docker build -t registry.cn-beijing.aliyuncs.com/jancco/itdb .
	rm -rf files

push:
	docker push registry.cn-beijing.aliyuncs.com/jancco/itdb
