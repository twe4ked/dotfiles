if run_bundle_install == 0
  echo "Installing bundles..."
  echo ""
  :BundleInstall
  echo "Restart vim"
  :cq
endif
