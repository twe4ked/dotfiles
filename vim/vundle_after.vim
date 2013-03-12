if run_bundle_install == 1
  echo "Installing bundles..."
  echo ""
  :BundleInstall
  echo "Restart vim"
  :cq
endif
