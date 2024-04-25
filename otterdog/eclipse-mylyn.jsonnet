local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-mylyn') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Mylyn",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/mylyn/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  secrets+: [
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/tools.mylyn/gitlab.eclipse.org/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('mylyn-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('org.eclipse.mylyn') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('org.eclipse.mylyn.all') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.builds') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.commons') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.context') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.context.mft') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.docs') {
      archived: true,
      default_branch: "master",
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('org.eclipse.mylyn.docs.intent.main') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.docs.vex') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.incubator') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.reviews') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.reviews.ui') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.tasks') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.mylyn.versions') {
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
