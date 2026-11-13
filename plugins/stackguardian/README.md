# StackGuardian

Work with [StackGuardian](https://www.stackguardian.io) from Claude. Ask in plain language why a run failed, deploy a template, change a workflow, add a guardrail or check your cloud posture. The plugin connects Claude to your organization through the StackGuardian MCP server and adds skills that walk Claude through multi-step changes, asking you at each decision instead of guessing.

## Set up

1. Install the plugin in Claude Code:

   ```
   /plugin install stackguardian --marketplace StackGuardian/claude-plugins
   ```

2. Run `/mcp` and sign in to the server for your region: **stackguardian-eu** (`app.stackguardian.io`) or **stackguardian-us** (`us.stackguardian.io`). The browser opens the StackGuardian consent page, where you choose the organization, the roles Claude may use and how long access lasts. You can ignore the server for the region you don't use.
3. Ask something small, such as _"Show my five most recent StackGuardian workflow runs and their status."_

Upgrading from version 1.0 asks you to sign in once more, because the plugin now uses one server address per region instead of one per organization.

To switch to another organization, open `/mcp`, clear the server's authentication, then sign in again and choose the other organization on the consent page.

The same server works in claude.ai chat and Cowork: add `https://api.app.stackguardian.io/api/v1/mcp` (or `https://api.us.stackguardian.io/api/v1/mcp` for the US region) as a custom connector in _Settings → Connectors_.

## What you can ask

| Area | For example |
| --- | --- |
| Workflows and runs | "Why did the last run of `prod-vpc` fail?" · "Start a new run of `prod-vpc`" |
| Approvals | "Approve the run of `prod-vpc` that's waiting for approval" |
| Templates | "Find a StackGuardian template for an S3 bucket" |
| Stacks and policies | "Which stacks have drift?" · "Which stacks have no policy attached?" |
| Secrets and connectors | "Is our AWS connector still authenticating?" |
| Cloud inventory and posture | "What are our ten most misconfigured AWS resources?" |

Tools that create, change, run or delete things act on your real organization. Claude asks before each such tool call, so read what it is about to do before you approve it.

## Skills

| Skill | Use it to |
| --- | --- |
| `sg-create-workflow` | Create a workflow from a StackGuardian template or your own git repository |
| `sg-update-workflow` | Change an existing workflow's settings; only what you change is touched |
| `sg-upgrade-workflow` | Move a workflow to another template revision, with a dry run first |
| `sg-create-stack` | Create a stack of workflows deployed together from a stack template |
| `sg-create-policy` | Add a guardrail that blocks, warns on or requires approval for changes |
| `sg-manage-roles` | Create, change or delete custom roles |
| `sg-manage-secrets` | Store, rotate or delete vault secrets and use them in workflows |
| `sg-create-connector` | Create a cloud or version-control connector that workflows deploy through |
| `sg-manage-connectors` | Inspect, test, update, scan or delete an existing connector |
| `sg-troubleshoot-connector` | Find out why a connector or a run that uses it is failing |
| `sg-writing-stackguardian-workflow-terraform` | Write or debug StackGuardian provider Terraform for workflows |
| `sg-writing-stackguardian-workflow-group-terraform` | Write or debug Terraform for workflow groups |
| `sg-writing-stackguardian-policy-terraform` | Write or debug Terraform for policies |

Start one with `/stackguardian:sg-create-workflow` and so on, or just describe the task and Claude picks the matching skill.

## What the plugin sends where

- The plugin contains no code that runs on your machine: only skills (Markdown and Terraform examples) and the MCP server configuration.
- Claude calls the StackGuardian API for your region (`api.app.stackguardian.io` or `api.us.stackguardian.io`), and only when you ask it to. Requests carry the access token from your sign-in, which is scoped to one organization and the roles you approved.
- Revoke access at any time from _Profile → Connected apps_ in the StackGuardian dashboard.
- StackGuardian handles the data under its [privacy policy](https://www.stackguardian.io/pages/privacy-policy).

## Support

[Documentation](https://docs.stackguardian.io/docs/mcp-server/) · [Contact](https://www.stackguardian.io/contact) · support@stackguardian.io

## License

Apache-2.0. See [LICENSE](LICENSE).
