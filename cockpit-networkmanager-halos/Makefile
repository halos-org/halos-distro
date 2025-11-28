.PHONY: build deploy test-cycle clean help

help:
	@echo "cockpit-networkmanager-halos build system"
	@echo ""
	@echo "Targets:"
	@echo "  build       - Build Debian package from wifi branch"
	@echo "  deploy      - Deploy package to test device"
	@echo "  test-cycle  - Full build + deploy cycle (target < 5min)"
	@echo "  clean       - Remove build artifacts"
	@echo "  help        - Show this help"
	@echo ""
	@echo "Environment variables:"
	@echo "  TEST_HOST   - Test device hostname (default: halos.local)"
	@echo "  TEST_USER   - Test device username (default: mairas)"

build:
	./scripts/build.sh

deploy:
	./scripts/deploy.sh

test-cycle:
	./scripts/test-cycle.sh

clean:
	rm -rf cockpit-src debian/cockpit-networkmanager-halos debian/.debhelper debian/files debian/debhelper-build-stamp
	rm -f ../cockpit-networkmanager-halos_*.deb ../cockpit-networkmanager-halos_*.buildinfo ../cockpit-networkmanager-halos_*.changes
	@echo "Build artifacts removed"
