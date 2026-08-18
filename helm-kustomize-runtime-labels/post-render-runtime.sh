#!/usr/bin/env bash
# Helm post-renderer script — runtime label variant.
#
# Place this file on the Harness delegate at:
#   /opt/harness-delegate/client-tools/post-render-runtime.sh
# and make it executable:
#   chmod +x /opt/harness-delegate/client-tools/post-render-runtime.sh
#
# Helm pipes rendered manifests to this script on stdin. The label value
# arrives as a positional arg via `helm --post-renderer-args`, which Harness
# populates from a pipeline runtime-input variable at execution time.
# Requires Helm 3.9+ on the delegate (--post-renderer-args was added there).
#
# Requires: kustomize on PATH or at /opt/harness-delegate/client-tools/kustomize

set -euo pipefail

KUSTOMIZE=$(command -v kustomize || true)
[ -z "$KUSTOMIZE" ] && [ -x /opt/harness-delegate/client-tools/kustomize ] \
  && KUSTOMIZE=/opt/harness-delegate/client-tools/kustomize

if [ -z "$KUSTOMIZE" ]; then
  echo "ERROR: kustomize not found. Install it on the delegate." >&2
  exit 1
fi

# Falls back to "unspecified" so the script still runs (and the gap is
# visible on the resource) if the pipeline variable was left blank.
LABEL_VALUE="${1:-unspecified}"

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

cat > "$WORK/all.yaml"

cat > "$WORK/kustomization.yaml" <<EOF
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - all.yaml
# includeSelectors: false  → labels are NOT added to selector fields,
#                            keeping them immutable across redeploys.
# includeTemplates: true   → labels ARE added to pod templates,
#                            so pods carry them (required for monitoring/netpol).
labels:
  - includeSelectors: false
    includeTemplates: true
    pairs:
      runtime-label: ${LABEL_VALUE}
      managed-by: harness
EOF

"$KUSTOMIZE" build "$WORK"
