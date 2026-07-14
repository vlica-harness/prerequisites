#!/usr/bin/env bash
# Helm post-renderer: reads Helm's rendered manifests on stdin, stamps a
# central set of labels onto every resource via Kustomize, prints to stdout.
#
# This is the ONE piece that must live on the delegate. All labels are defined
# here in a single place — edit this file to add/remove labels for every
# deployment, with zero changes to any chart.
set -euo pipefail

# Harness delegates bundle the kustomize binary; fall back to PATH.
KUSTOMIZE=$(command -v kustomize || ls /opt/harness-delegate/client-tools/kustomize/*/kustomize 2>/dev/null | head -1)

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

# Helm streams the rendered YAML to the post-renderer on stdin.
cat > "$WORK/all.yaml"

cat > "$WORK/kustomization.yaml" <<'EOF'
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - all.yaml
# includeSelectors:false => labels go on metadata + pod template only,
# NOT on selectors. This keeps Deployment/Service selectors immutable so you
# can add or remove labels later without "field is immutable" errors.
labels:
  - includeSelectors: false
    pairs:
      team: backend
      cost-center: eng-platform
      managed-by: harness
      environment: dev
EOF

"$KUSTOMIZE" build "$WORK"
