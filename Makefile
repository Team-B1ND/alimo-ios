generate:
	mise exec -- tuist generate

edit:
	mise exec -- tuist edit

install:
	mise exec -- tuist install

go:
	mise exec -- tuist install
	mise exec -- tuist generate

clean:
	mise exec -- tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
	make clean-spm

clean-spm:
	rm -rf ~/Library/Caches/org.swift.swiftpm
	rm -rf ~/Library/org.swift.swiftpm
