#!/usr/bin/env bash

set -eux

pushd $(dirname $0)
  ./make_golang_project_spec_file.sh s3-blobstore-backup-restorer s3-blobstore-backup-restore
  ./make_golang_project_spec_file.sh azure-blobstore-backup-restorer azure-blobstore-backup-restore
  ./make_golang_project_spec_file.sh gcs-blobstore-backup-restorer gcs-blobstore-backup-restore
  ./make_golang_project_spec_file.sh database-backup-restorer database-backup-restore
popd

# We have a weird transitive dependency on golang.org/x/sys/unix that isn't captured normally
pushd $(dirname $0)/../packages/gcs-blobstore-backup-restorer
  echo "- github.com/cloudfoundry-incubator/vendor/golang.org/x/sys/unix/*" >> spec
popd
