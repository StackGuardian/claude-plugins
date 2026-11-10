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

Claude Code asks for your StackGuardian organization. Then run `/mcp` and sign in to `stackguardian-eu` or `stackguardian-us`, whichever region your organization is in. See the [plugin README](plugins/stackguardian/README.md) for details.

Using another coding agent? [`@stackguardian/mcp-wizard`](https://github.com/StackGuardian/stackguardian-mcp) installs the same server and skills into Codex, Cursor, VS Code, Gemini CLI and more.

## Contributing

The skills are copied from [stackguardian-mcp](https://github.com/StackGuardian/stackguardian-mcp) by `scripts/sync-skills.sh`; change them there. The `sync-skills` workflow opens a pull request here when they change, with the plugin version bumped.

Check a change locally with `claude plugin validate --strict plugins/stackguardian` and `claude plugin validate --strict .`, then try it with `claude --plugin-dir plugins/stackguardian`.

## License

Apache-2.0. See [LICENSE](LICENSE).
