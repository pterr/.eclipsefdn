local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.keyple', 'eclipse-keyple') {
  settings+: {
    blog: "https://keyple.org/",
    description: "Organization grouging together all the Eclipse Keyple project repositories",
    email: "keyple-dev@eclipse.org",
    name: "Eclipse Keyple",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },  
  secrets+: [
    orgs.newOrgSecret('ORG_GITHUB_BOT_TOKEN') {
      value: "pass:bots/iot.keyple/github.com/api-token",
    },
     orgs.newOrgSecret('GPG_KEY_ID') {
      value: 'pass:bots/iot.keyple/gpg/key_id',
    },
    orgs.newOrgSecret('GPG_SUBKEY_ID') {
      value: 'pass:bots/iot.keyple/gpg/subkey_id',
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/iot.keyple/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/iot.keyple/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/iot.keyple/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/iot.keyple/central.sonatype.org/token-username",
    },
    orgs.newOrgSecret('SSH_PRIVATE_KEY') {
      value: 'pass:bots/iot.keyple/projects-storage.eclipse.org/id_rsa',
    },
    orgs.newOrgSecret('SSH_PASSPHRASE') {
      value: 'pass:bots/iot.keyple/projects-storage.eclipse.org/id_rsa.passphrase',
    },
    orgs.newOrgSecret('SSH_USERNAME') {
      value: 'pass:bots/iot.keyple/projects-storage.eclipse.org/username',
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: raw repository to handle issue: global for the project, or specific for a new component  to create",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('develop') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-card-calypso-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-card-calypso-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-card-calypso-crypto-legacysam-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "main",
      delete_branch_on_merge: false,
      description: "keyple-card-calypso-crypto-legacysam-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-java-bom') {
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: A Bill of Materials (BOM) for Java/Kotlin applications to manage the versions of all Keyple artifacts",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-card-calypso-crypto-legacysam-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: Calypso legacy SAM extension lib for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-card-calypso-crypto-pki-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: Calypso PKI extension lib for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-card-calypso-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: Calypso card extension lib for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-card-generic-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-card-generic-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-card-generic-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: add-on library to operate generic smartcard solution (based on the Calypso Terminal Card API) / for end users",
      has_wiki: false,
      homepage: "",
      topics+: [
        "java",
        "keyple"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-common-cpp-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-common-cpp-api",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-common-java-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin",
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: common API for all modules",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-cpp') {
      archived: true,
      default_branch: "master",
      description: "'DEPRECATED' Eclipse Keyple™ Project: all components of the C++ implementation until version 0.9.0",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('develop') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-cpp-example') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: use case examples of the Keyple C++ components for end users",
      homepage: "https://keyple.org",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-cpp-meta') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-cpp-meta",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-distributed-local-java-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: API for distributed local service developers",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-distributed-local-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: distributed local service API for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-distributed-network-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: distributed network API for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-distributed-remote-java-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: API for distributed remote plugin developers",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-distributed-remote-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: distributed remote plugin API for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-interop-jsonapi-client-kmp-lib') {
      aliases: ['keyple-less-distributed-client-kmp-lib', 'keypleless-distributed-client-kmp-lib'],
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: A multiplatform client library implementing the Keyple Server JSON API and Selection JSON Specification to enable non-Keyple applications to interact with a Keyple server.",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-interop-localreader-nfcmobile-kmp-lib') {
      aliases: ['keyple-less-reader-nfcmobile-kmp-lib', 'keypleless-reader-nfcmobile-kmp-lib'],
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: A multiplatform adapter providing a LocalReader SPI implementation to allow non-Keyple applications to control the local NFC reader",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-interop-jsonapi-client-nfc-xcframework') {
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: An XCFramework for iOS applications to interface with a remote Keyple-based control server over JSON API",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-integration-java-test') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: java integration tests / internal to the project",
      homepage: "",
      topics+: [
        "internal",
        "java",
        "keyple",
        "support"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-java') {
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "'DEPRECATED' Eclipse Keyple™ Project: deprecated repository embedding all components of the Java implementation until version 1.0.0",
      homepage: "https://keyple.org/",
      topics+: [
        "deprecated",
        "end-users",
        "java",
        "keyple"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('develop') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-java-example') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: use case examples of the Keyple Java components for end users",
      homepage: "https://keyple.org",
      topics+: [
        "java",
        "keyple",
        "support"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-ops') {
      archived: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: Ops settings",
      has_wiki: false,
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-android-nfc-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: Android NFC plugin library for end users",
      homepage: "",
      topics+: [
        "android",
        "keyple",
        "plugin"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-android-omapi-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: Android OMAPI plugin API for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-plugin-cardresource-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: Card Resource plugin lib for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-cpp-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project - C++ implementation: API for plugin developers",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-java-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project - Java implementation: API for plugin developers",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-plugin-storagecard-java-api') {
      aliases: ['keyple-plugin-storage-card-java-api'],
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin",
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project - Storage Card Plugin API",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-plugin-pcsc-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-plugin-pcsc-cpp-lib",web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-pcsc-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: PC/SC plugin lib for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-plugin-stub-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-plugin-stub-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-plugin-stub-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: stub plugin API for end users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-service-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project - C++ implementation: main service API for end users",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-service-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project - Java implementation: main service API for end users",
      has_projects: false,
      has_wiki: false,
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-service-resource-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      delete_branch_on_merge: false,
      description: "keyple-service-resource-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-service-resource-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: add-on library to define a profile-based card resource allocation mechanism",
      homepage: "",
      topics+: [
        "core",
        "java",
        "keyple"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-util-cpp-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "c-cpp"
      ],
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "keyple-util-cpp-lib",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('keyple-util-java-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse Keyple™ Project: utility library for all users",
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('keyple-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "javascript-typescript",
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple™ Project: https://keyple.org/ website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_wiki: false,
      homepage: "https://keyple.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('keyple-api-docs') {
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_setup_enabled: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: false,
      description: "Eclipse Keyple project repository centralizing API documentation (Javadoc, Doxygen) from all Keyple libraries",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_projects: false,
      has_wiki: false,
      homepage: "https://keyple.org/",
      topics+: [
        "documentation",
        "javadoc",
        "doxygen",
        "keyple"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
      },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('keyple-actions') {
      local thisRepo = self,
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages: [
        "actions",
        "python",
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Keyple project repository containing reusable GitHub Actions for Keyple projects",
      gh_pages_build_type: "disabled",
      has_projects: false,
      has_wiki: false,
      homepage: "https://keyple.org/",
      topics+: [
        "github-actions",
        "ci-cd",
        "automation",
        "keyple"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule(thisRepo.default_branch) {
           required_approving_review_count: 1,
           requires_status_checks: true,
           requires_strict_status_checks: true,
        },
      ],
    },
  ],
}
