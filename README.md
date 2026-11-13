# StackGuardian plugins for Claude

The official [StackGuardian](https://www.stackguardian.io) plugin marketplace for Claude Code.

| Plugin | What it does |
| --- | --- |
| [`stackguardian`](plugins/stackguardian) | Connects Claude to your StackGuardian organization through the StackGuardian MCP server, with guided skills for workflows, stacks, policies, roles, secrets and StackGuardian Terraform. |

## Install

In Claude Code:

```
/plugin marketplace add StackGuardian/claude-plugins
/plugin install stackguardian@stackguardian
```

Then run `/mcp` and sign in to `stackguardian-eu` or `stackguardian-us`, whichever region your organization is in, and choose the organization on the consent page. See the [plugin README](plugins/stackguardian/README.md) for details.

Using another coding agent? [`@stackguardian/mcp-wizard`](https://github.com/StackGuardian/stackguardian-mcp) installs the same server and skills into Codex, Cursor, VS Code, Gemini CLI and more.

## Contributing

Don't edit the skills here. They come from the StackGuardian MCP server's repository, whose `sync_public_skills.yml` workflow opens a pull request here when they change, with the plugin version bumped.

Check a change locally with `claude plugin validate --strict plugins/stackguardian` and `claude plugin validate --strict .`, then try it with `claude --plugin-dir plugins/stackguardian`.

## License

Apache-2.0. See [LICENSE](LICENSE).
