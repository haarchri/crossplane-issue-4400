reproduce https://github.com/crossplane/crossplane/issues/4400

```bash

./setup.sh
kubectl logs -n crossplane-system crossplane-798547c55c-vz94z -c crossplane-init

{"level":"info","ts":"2023-07-28T07:47:16Z","logger":"crossplane","msg":"Given tls secret is already filled, skipping tls certificate generation","Step":"WebhookCertificateGenerator"}
{"level":"info","ts":"2023-07-28T07:47:16Z","logger":"crossplane","msg":"Step has been completed","Name":"WebhookCertificateGenerator"}
crossplane: error: core.initCommand.Run(): cannot initialize core: cannot apply crd: cannot patch object: CustomResourceDefinition.apiextensions.k8s.io "compositionrevisions.apiextensions.crossplane.io" is invalid: status.storedVersions[0]: Invalid value: "v1alpha1": must appear in spec.versions

```
