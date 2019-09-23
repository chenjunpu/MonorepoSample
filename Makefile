.PHONY : log bootstrap kill_xcode clean project

ROOT_PATH = App/
SPEC = project.yml

log:
	echo "Make"

bootstrap: 
	sh ./Scripts/bootstrap.sh

update_cocoapods:
	pod repo update
	pod install

kill_xcode:
	killall Xcode || true

clean: kill_xcode
	killall Simulator || true
	rm -rf $(ROOT_PATH)*.xcodeproj

project: kill_xcode
	xcodegen --spec $(ROOT_PATH)$(SPEC)
	open $(ROOT_PATH)*.xcodeproj
