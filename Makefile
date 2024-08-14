generate:
	mise exec -- tuist generate

edit:
	mise exec -- tuist edit

fetch:
	mise exec -- tuist fetch

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
	make clean-spm

clean-spm:
	rm -rf ~/Library/Caches/org.swift.swiftpm
	rm -rf ~/Library/org.swift.swiftpm
